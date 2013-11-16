# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'birth_control/version'

Gem::Specification.new do |spec|
  spec.name          = "birth_control"
  spec.version       = BirthControl::VERSION
  spec.authors       = ["Johannes Opper"]
  spec.email         = ["xijo@gmx.de"]
  spec.description   = %q{Count active record instantiations and report them to the log}
  spec.summary       = %q{Count active record instantiations and report them to the log}
  spec.homepage      = "http://github.com/xijo/birth_control"
  spec.license       = "WTFPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'terminal-table'
  spec.add_dependency 'actionpack'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
