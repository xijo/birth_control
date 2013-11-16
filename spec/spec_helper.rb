require 'simplecov'

SimpleCov.adapters.define 'gem' do
  add_filter '/spec/'
  add_group 'Libraries', '/lib/'
end
SimpleCov.start 'gem'

require 'birth_control'

RSpec.configure do |config|
  config.color_enabled = true
end
