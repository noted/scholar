# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "scholar"
  gem.version       = "0.1.1.1"
  gem.authors       = ["Ethan Turkeltaub"]
  gem.email         = ["ethan.turkeltaub@gmail.com"]
  gem.description   = %q{Generate valid MLA citations.}
  gem.summary       = %q{Generate valid MLA citations.}
  gem.homepage      = "http://github.com/noted/scholar"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 4.0.0'
  gem.add_dependency 'faraday', '~> 0.8.7'
  gem.add_dependency 'faraday_middleware', '~> 0.9.0'
end
