Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "~> 14.04"

  config.vm.provider :virtualbox do |v|
    v.name = "appium_ubuntu"
    v.customize ["modifyvm", :id, "--memory", "2048", "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--usb", "on"]

    v.customize ["usbfilter", "add", "0", "--target", :id, "--name", "Nexus 5X", "--vendorid", "0x18d1", "--productid", "0x4ee2"]
    v.customize ["usbfilter", "add", "0", "--target", :id, "--name", "Nexus 5", "--vendorid", "0x18d1", "--productid", "0x4ee2"]
  end
  config.vm.provision "docker"
end
