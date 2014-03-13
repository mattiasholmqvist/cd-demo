Vagrant.require_plugin "vagrant-aws"

# Set provider
provider ||= ENV['VAGRANT_DEFAULT_PROVIDER']
provider ||= 'virtualbox'
ARGV.each do |arg|
  if arg =~ /(^|=)aws/
    provider='aws'
  end
end

Vagrant.configure("2") do |config|

  config.vm.define "cd-demo" do |node_config|
    node_config.vm.synced_folder "synced/", "/vagrant"
    # TODO: use combined box instead...
    node_config.vm.box = "cd-demo-java"
    #node_config.vm.box = "cd-demo-java-aws"

    # Default VirtualBox configuration
    node_config.vm.provider "virtualbox" do |vb|
      node_config.vm.network :forwarded_port, guest: 8080, host: 8080
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      node_config.ssh.username = "vagrant"
    end

    node_config.vm.provider "aws" do |aws|
      aws.region = "eu-west-1"
      aws.ami = "ami-ff0af688"
      aws.instance_type = "t1.micro"
      aws.keypair_name = "citerus-cd-demo"
      aws.security_groups = ["quicklaunch-1"]
      aws.instance_ready_timeout = 180
      #node_config.ssh.private_key_path = "~/.ssh/citerus-cd-demo.pem"
      #node_config.ssh.username = "ubuntu"
    end
  end

end

