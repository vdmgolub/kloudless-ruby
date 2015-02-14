# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kloudless/version'

Gem::Specification.new do |spec|
  spec.name          = "kloudless"
  spec.version       = Kloudless::VERSION
  spec.authors       = ["Jerry Cheung"]
  spec.email         = ["jollyjerry@gmail.com"]
  spec.summary       = %q{Ruby Kloudless API client. The last cloud storage API you’ll ever need.}
  spec.description   = %q{Ruby Kloudless API client}
  spec.homepage      = "https://github.com/jch/kloudless-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.1"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "byebug", "~> 3"
  spec.add_development_dependency "minitest", "~> 5"
end
