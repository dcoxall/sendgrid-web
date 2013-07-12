# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendgrid/web/version'

Gem::Specification.new do |spec|
  spec.name          = "sendgrid-web"
  spec.version       = Sendgrid::Web::VERSION
  spec.authors       = ["Darren Coxall"]
  spec.email         = ["darren@darrencoxall.com"]
  spec.description   = 'A ruby 2 optimised API client used to communicate with the Sendgrid Web API.'
  spec.summary       = 'Interact with the Sendgrid Web API'
  spec.homepage      = "https://github.com/FreakyDazio/sendgrid-web"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", ">= 0.11.0"
  spec.add_runtime_dependency "oj", "~> 2.1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14.0"
end
