
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Based on https://github.com/adlawson/vagrantfiles/blob/master/nodejs/Vagrantfile
Vagrant.configure("2") do |config|

    hostname = "pea.box"
    locale = "en_US.UTF.8"

    db_password = "password"

    # Box
    config.vm.box = "ubuntu/trusty64"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end

    # Shared folders
    config.vm.synced_folder ".", "/project/", type: "rsync", rsync__exclude: [
      ".git/",
      ".packages",
      "packages",
      ".pub/"
    ], rsync__include: [
      "build/packages/"
    ]

    # Port forwarding
    config.vm.network "forwarded_port", guest: 1337, host: 1337

    # Basic
    config.vm.provision :shell, :inline => "touch .hushlogin"
    config.vm.provision :shell, :inline => "hostnamectl set-hostname #{hostname} && locale-gen #{locale}"
    config.vm.provision :shell, :inline => "apt-get update --fix-missing"

    # Dart
    config.vm.provision :shell, :inline => "apt-get install -q -y apt-transport-https curl git"
    config.vm.provision :shell, :inline => "curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -"
    config.vm.provision :shell, :inline => "curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list"
    config.vm.provision :shell, :inline => "apt-get update"
    config.vm.provision :shell, :inline => "apt-get install -q -y dart"
    config.vm.provision :shell, :inline => 'echo "export PATH=$PATH:/usr/lib/dart/bin:/home/vagrant/.pub-cache/bin" >> /home/vagrant/.bashrc'

    # Sass
    config.vm.provision :shell, :inline => 'gem install sass'

    # Postgres
    config.vm.provision :shell, :inline => "apt-get install -q -y postgresql postgresql-contrib"
    config.vm.provision :shell, :inline => "sudo -u postgres psql -U postgres -d postgres -c \"alter user postgres with password '#{db_password}';\""

    # Embla
    config.vm.provision :shell, :inline => "su - vagrant -c '/usr/lib/dart/bin/pub global activate embla'"

    # Grinder
    config.vm.provision :shell, :inline => "su - vagrant -c '/usr/lib/dart/bin/pub global activate grinder'"
end
