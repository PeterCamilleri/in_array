#Specify the building of the in_array gem.

Gem::Specification.new do |s|
  s.name = "in_array"
  s.summary = "Encapsulate data in an array unless it's already in one."
  s.description = "Encapsulate data in an array unless it's already in one. "
  s.version = '0.1.1' 
  s.author = ["Peter Camilleri"]
  s.email = "peter.c.camilleri@gmail.com"
  s.homepage = "http://teuthida-technologies.com/"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'reek'
  s.add_development_dependency 'minitest'
  s.files = ['lib/in_array.rb', 'tests/in_array_test.rb', 'rakefile.rb', 'license.txt', 'README', 'reek.txt']
  s.extra_rdoc_files = ['license.txt']
  s.test_files = ['tests/in_array_test.rb']
  s.license = 'MIT'
  s.has_rdoc = true
  s.require_path = 'lib'
end

