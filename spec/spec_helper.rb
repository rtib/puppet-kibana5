require 'puppetlabs_spec_helper/module_spec_helper'
require 'coveralls'

RSpec.configure do |config|
  config.after(:suite) do
    Coveralls.wear!
    RSpec::Puppet::Coverage.report!
  end
end
