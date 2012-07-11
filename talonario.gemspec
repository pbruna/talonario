# -*- encoding: utf-8 -*-
require File.expand_path('../lib/talonario/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Patricio Bruna"]
  gem.email         = ["pbruna@itlinux.cl"]
  gem.description   = %q{Work with Chile SII}
  gem.summary       = %q{Send and receive Electronic Tributary Documents in Chile}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "talonario"
  gem.require_paths = ["lib"]
  gem.version       = Talonario::VERSION
  
  gem.add_dependency 'nokogiri'
  
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'turn'
end
