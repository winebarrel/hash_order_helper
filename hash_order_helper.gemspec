# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'hash_order_helper'
  spec.version       = '0.1.5'
  spec.authors       = ['Genki Sugawara']
  spec.email         = ['sugawara@cookpad.com']

  spec.summary       = %q{Add methods to manipulate the order of the entries in the Hash object.}
  spec.description   = %q{Add methods to manipulate the order of the entries in the Hash object.}
  spec.homepage      = 'https://github.com/winebarrel/hash_order_helper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
