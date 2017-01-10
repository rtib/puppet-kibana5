require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'coveralls'
include RspecPuppetFacts

Coveralls.wear! do
  add_filter '/spec/fixtures/modules/kibana5/'
end
