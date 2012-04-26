# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rjiffy/version"

Gem::Specification.new do |s|
  s.name        = "rjiffy"
  s.version     = Rjiffy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Frank Mueller"]
  s.email       = ["frank@heidjer.info"]
  s.homepage    = ""
  s.summary     = "Rjiffy"
  s.description = "Ruby Wrapper for the jiffybox.de API"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('wrest', '~> 1.5.0')
  s.add_dependency('hashie', '~> 1.2.0')
  s.add_dependency('i18n')
  s.add_dependency('jruby-openssl') if RUBY_PLATFORM == 'java'

  s.add_development_dependency('rspec', '~> 2.9.0')
  s.add_development_dependency('fakeweb', '~> 1.3.0')
  s.add_development_dependency('simplecov', '~> 0.6.2')
end
