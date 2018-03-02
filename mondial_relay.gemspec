# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mondial_relay/version'

Gem::Specification.new do |spec|
  spec.name          = 'mondial_relay'
  spec.version       = MondialRelay::VERSION

  spec.authors       = ['Žilvinas Verseckas']
  spec.email         = ['zilvinas.verseckas@vinted.com']

  spec.summary       = 'Mondial Relay client'
  spec.description   = 'An interface for the Mondial Relay Web Service'
  spec.homepage      = 'https://github.com/vinted/mondial_relay'

  spec.license       = 'MIT'

  spec.files =
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'savon', '~> 2.0'
  spec.add_runtime_dependency 'interactor-initializer', '~> 0.1'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'webmock', '~> 3.3'
  spec.add_development_dependency 'factory_bot', '~> 4.8'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'redcarpet', '~> 3.4'
end
