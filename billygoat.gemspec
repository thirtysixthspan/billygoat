# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billygoat/version'

Gem::Specification.new do |spec|
  spec.name          = "billygoat"
  spec.version       = Billy::VERSION
  spec.authors       = ["Derrick Parkhurst"]
  spec.email         = ["derrick.parkhurst@gmail.com"]
  spec.summary       = "Goat do this for me"
  spec.description   = "Goat do this for me"
  spec.homepage      = "https://github.com/thirtysixthspan/billygoat"
  spec.license       = "MIT"

  spec.files = Dir['Rakefile', '{bin,lib,spec}/**/*', 'README*', 'LICENSE*']
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"

  spec.add_dependency "git", "~> 1.2"
end
