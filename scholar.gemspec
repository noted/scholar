# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scholar/version'

Gem::Specification.new do |spec|
  spec.name          = 'scholar'
  spec.version       = '0.2.0'
  spec.authors       = ['Ethan Turkeltaub']
  spec.email         = ['ethan.turkeltaub@gmail.com']
  spec.summary       = %q{Scholar makes citation easier.}
  spec.description   = %q{Scholar makes citiaton easier.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'citeproc-ruby', '~> 0.0.6'

  # spec.add_development_dependency 'bundler', '~> 1.5'
end
