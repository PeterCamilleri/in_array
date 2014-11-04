# coding: utf-8

#Specify the building of the in_array gem.

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'in_array/version'

Gem::Specification.new do |s|
  s.name = "in_array"
  s.summary = "Encapsulate data in an array."
  s.description = "Encapsulate data in an array unless it's already in one. "
  s.version = InArray::VERSION
  s.author = ["Peter Camilleri"]
  s.email = "peter.c.camilleri@gmail.com"
  s.homepage = "http://teuthida-technologies.com/"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9.3'

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'reek', "~> 1.3.8"
  s.add_development_dependency 'minitest', "~> 4.7.5"
  s.add_development_dependency 'rdoc', "~> 4.0.1"

  s.files       = `git ls-files`.split($/)
  s.extra_rdoc_files = ['license.txt']
  s.test_files = ['tests/in_array_test.rb']

  s.license = 'MIT'
  s.has_rdoc = true
  s.require_path = 'lib'
end

