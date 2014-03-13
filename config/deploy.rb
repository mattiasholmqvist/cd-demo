before :deploy, 'deploy:generate_config'

namespace :deploy do

  task :generate_config do
    on roles(:app), in: :parallel do |host|
    ssh_options = host.ssh_options
    info "Generating #{ssh_options[:config]}..."
    config_dir = File.dirname(File.expand_path(ssh_options[:config]))
      Dir.mkdir(config_dir) unless Dir.exists?(config_dir)
      system("vagrant ssh-config #{host.hostname} > #{ssh_options[:config]}")
    end
  end

  task :updating do
    on roles(:app) do |host|
      sudo "stop cd-demo-service ||true"
      upload! "service.yml", "service.yml"
      upstart_template = './upstart.conf.erb'
      upstart_file = File.basename("upstart.conf.erb", '.erb')
      template = Template.new(
          user: host.user
      )
      upload! StringIO.new(template.erb(upstart_template)), "upstart.conf"
      info "Template: #{template.erb(upstart_template)}"
      sudo :mv, "upstart.conf", "/etc/init/cd-demo-service.conf"
      upload! "target/cd-demo-1.0-SNAPSHOT.jar", "service.jar"
    end
  end


  task :publishing do
    on roles(:app) do |host|
      info "Starting service..."
      sudo "start cd-demo-service"
    end
  end

end
