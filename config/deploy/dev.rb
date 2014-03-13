set :stage, :dev

role :app, %w{deploy@cd-demo}

server 'cd-demo',
       {:user => 'vagrant',
        :roles => %w{app},
        :ssh_options => {:config => ".capistrano/dev_ssh_config"}}
