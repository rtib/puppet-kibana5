require 'spec_helper'
describe 'kibana5' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      context 'with default values for all parameters' do
        it do
          is_expected.to compile.with_all_deps
          is_expected.to contain_class('kibana5')
        end
      end
      context 'repository settings' do
        it do
          is_expected.to contain_class('kibana5::repo')
          is_expected.to contain_apt__key('elasticsearch-kibana5')
          is_expected.to contain_apt__source('elasticsearch-kibana5')
        end
      end
      context 'installation' do
        it do
          is_expected.to contain_class('kibana5::install')
          is_expected.to contain_package('kibana').with(
            'ensure' => 'latest'
          )
        end
      end
      context 'configuration' do
        it do
          is_expected.to contain_class('kibana5::config')
        end
      end
      context 'service' do
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
  end
end
