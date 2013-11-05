# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'scholar/version'

Gem::Specification.new do |spec|
  spec.name          = 'scholar'
  spec.version       = Scholar::VERSION
  spec.authors       = ['Ethan Turkeltaub']
  spec.email         = ['ethan.turkeltaub@gmail.com']
  spec.description   = %q{Citing your sources shouldn't be hard.}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/noted/scholar'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
