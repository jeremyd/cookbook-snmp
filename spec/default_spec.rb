require 'spec_helper'

describe 'snmp::default' do
  context 'on Centos 6.4' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.4).converge(described_recipe)
    end

    it 'installs net-snmp' do
      expect(chef_run).to install_package('net-snmp')
    end

    it 'installs net-snmp-utils' do
      expect(chef_run).to install_package('net-snmp-utils')
    end

    it 'starts and enables snmpd' do
      expect(chef_run).to start_service('snmpd')
      expect(chef_run).to enable_service('snmpd')
    end
  end

  context 'on Ubuntu 13.04 ' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: 13.04).converge(described_recipe)
    end

    it 'installs snmp' do
      expect(chef_run).to install_package('snmp')
    end

    it 'installs snmpd' do
      expect(chef_run).to install_package('snmpd')
    end

    it 'starts and enables snmpd' do
      expect(chef_run).to start_service('snmpd')
      expect(chef_run).to enable_service('snmpd')
    end
  end

  context 'on SUSE 11.03' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'suse', version: 11.03).converge(described_recipe)
    end

    it 'installs net-snmp' do
      expect(chef_run).to install_package('net-snmp')
    end

    it 'starts and enables snmpd' do
      expect(chef_run).to start_service('snmpd')
      expect(chef_run).to enable_service('snmpd')
    end
  end

end
