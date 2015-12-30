# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cronologist/version'

Gem::Specification.new do |spec|
  spec.name          = "cronologist"
  spec.version       = Cronologist::VERSION
  spec.authors       = ["David Hollis"]
  spec.email         = ["dhollis@raybeam.com"]
  spec.summary       = %q{A ruby library for parsing cron specifications.}
  spec.homepage      = "https://github.com/davidh-raybeam/cronologist"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "treetop"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
