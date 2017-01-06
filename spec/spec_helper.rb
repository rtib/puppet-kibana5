require 'puppetlabs_spec_helper/module_spec_helper'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
