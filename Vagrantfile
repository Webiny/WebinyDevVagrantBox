require 'json'
require 'yaml'
require_relative 'lib/os'

VAGRANTFILE_API_VERSION = "2"

webinyDevYamlPath = File.expand_path("./configs/webiny-dev.yaml")
afterScriptPath = File.expand_path("./scripts/customize.sh")
aliasesPath = File.expand_path("./configs/aliases")

require_relative 'lib/webiny-dev.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
	if File.exists? aliasesPath then
		config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
	end

	WebinyDev.configure(config, YAML::load(File.read(webinyDevYamlPath)))

	if File.exists? afterScriptPath then
		config.vm.provision "shell", path: afterScriptPath
	end
end
