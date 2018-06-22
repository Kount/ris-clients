Gem::Specification.new do |s|
  s.name        = 'kount_complete'
  s.version     = '1.0.5'
  s.summary     = "Kount Complete Services Wrapper"
  s.description = "A wrapper to facilitate making Kount RIS calls"
  s.authors     = ["Kount"]
  s.files       = Dir.glob("lib/**/*")
  s.homepage    = 'http://rubygems.org/gems/kount_complete'
  s.license     = 'MIT'

  s.required_rubygems_version = '>= 1.3.5'

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rest-client', '>= 1.8.0', '< 3.0.0'

  s.add_development_dependency 'rspec', '~> 0'
end
