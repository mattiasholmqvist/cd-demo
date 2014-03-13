set :stage, :staging

role :app, %w{ubuntu@cd-demo}

server 'cd-demo',
       {:user => 'ubuntu',
        :roles => %w{app},
        :ssh_options => {:config => ".capistrano/staging_ssh_config"}}