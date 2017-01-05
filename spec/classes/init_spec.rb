require 'spec_helper'
describe 'kibana5' do
  let :default_facts do
    {
      osfamily: 'Debian',
      operatingsystem: 'Debian',
      operatingsystemrelease: '8',
      lsbdistcodename: 'jessie',
      lsbdistid: 'jessie',
      puppetversion: '4.8.1'
    }
  end
  context 'with default values for all parameters' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to compile.with_all_deps
      is_expected.to contain_class('kibana5')
    end
  end
  context 'repository settings' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('kibana5::repo')
      is_expected.to contain_apt__key('elasticsearch-kibana5')
      is_expected.to contain_apt__source('elasticsearch-kibana5')
    end
  end
  context 'installation' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('kibana5::install')
      is_expected.to contain_package('kibana').with(
        'ensure' => 'latest'
      )
    end
  end
  context 'configuration' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('kibana5::config')
    end
  end
  context 'service' do
    let :facts do
      default_facts
    end

    it do
      is_expected.to contain_class('kibana5::service')
      is_expected.to contain_service('kibana').with(
        'ensure'     => 'running',
        'enable'     => true,
        'hasstatus'  => true,
        'hasrestart' => true
      )
    end
  end
end
