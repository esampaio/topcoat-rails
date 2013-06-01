# -*- encoding: utf-8 -*-
require File.expand_path('../lib/topcoat-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eduardo Sampaio"]
  gem.email         = ["eduardo@esampaio.com"]
  gem.description   = %q{Add Adobe's Topcoat to your Rails app}
  gem.summary       = %q{Adobe's Topcoat for Rails 3 applications}
  gem.homepage      = "http://github.com/esampaio/topcoat-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "topcoat-rails"
  gem.require_paths = ["lib"]
  gem.version       = Topcoat::Rails::VERSION

  gem.add_dependency "railties", ">= 3.0"
  gem.add_development_dependency "bundler", ">= 1.0"
  gem.add_development_dependency "rails",   ">= 3.1"
end
