# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'music'
  spec.version       = '1.0'
  spec.authors       = ['arnovr']
  spec.email         = ['ooeeehh']
  spec.summary       = 'Some stuff about music'
  spec.description   = 'Stuff about music'
  spec.homepage      = 'http://domainforproject.com/'
  spec.license       = 'MIT'
  spec.files         = ['lib/webapp.rb']
  spec.executables   = ['bin/music']
  spec.test_files    = ['tests/test_*.rb']
  spec.require_paths = ['lib']
end
