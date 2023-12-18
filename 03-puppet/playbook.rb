$network_ip = "192.168.33"
$network_mask = "255.255.255.0"

$puppet_server = "master.puppet"
$puppet_repo = "https://github.com/Gnom4wrd/devops-hometasks/puppet-repo.git"

$ansible_playbook = "provision.yml"
$ansible_inventory = "inventory.ini"

$vm_names = ["master", "slave1", "slave2"]

def create_vm(config, name, ip)
  config.vm.define name do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "#{name}.puppet"
    node.vm.network "private_network", ip: "#{ip}", netmask: "#{$network_mask}"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
   
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "#{$ansible_playbook}"
      ansible.inventory_path = "#{$ansible_inventory}"
      ansible.groups = {
        "puppet_servers" => ["master.puppet"],
        "puppet_agents" => ["slave1.puppet", "slave2.puppet"]
      }
    end
  end
end