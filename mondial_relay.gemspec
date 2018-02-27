# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mondial_relay/version'

Gem::Specification.new do |spec|
  spec.name          = 'vinted-mondial_relay'
  spec.version       = MondialRelay::VERSION

  spec.authors       = ['Žilvinas Verseckas']
  spec.email         = ['zilvinas.verseckas@vinted.com']

  spec.summary       = 'Mondial Relay client'
  spec.description   = 'Mondial Relay client'

  spec.license       = 'MIT'

  spec.require_paths = ['lib']
  spec.bindir = 'bin'

  spec.add_runtime_dependency 'savon', '~> 2.0'
  spec.add_runtime_dependency 'interactor-initializer', '~> 0.1'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'webmock', '~> 3.3'
  spec.add_development_dependency 'factory_bot', '~> 4.8'
end
