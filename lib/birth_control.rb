require 'active_support'
require 'singleton'

module BirthControl
  def self.enable=(enable)
    @enabled = enable
  end

  def self.enabled?
    !!@enabled
  end
end

require 'birth_control/extensions/active_record'
require 'birth_control/extensions/controller'
require 'birth_control/counter'
require 'birth_control/railtie' if defined?(Rails)
require 'birth_control/report'
require 'birth_control/version'

