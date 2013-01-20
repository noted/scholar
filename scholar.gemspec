# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "scholar"
  gem.version       = "0.1.0"
  gem.authors       = ["Ethan Turkeltaub"]
  gem.email         = ["ethan.turkeltaub@gmail.com"]
  gem.description   = %q{Scholarly citations with EasyBib.}
  gem.summary       = %q{Scholarly citations with EasyBib.}
  gem.homepage      = "http://github.com/noted/scholar"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 3.2.11'
end
