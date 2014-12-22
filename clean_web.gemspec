# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# noinspection RubyResolve
require 'clean_web/version'

Gem::Specification.new do |spec|
  spec.name          = 'clean_web'
  spec.version       = CleanWeb::VERSION
  spec.authors       = ['Sirruf']
  spec.email         = ['sirruf@me.com']
  spec.summary       = 'Simple module for Yandex CleanWeb API'
  spec.description   = 'Module for Rails to check text messages for spam.'
  spec.homepage      = 'https://github.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6'
end
