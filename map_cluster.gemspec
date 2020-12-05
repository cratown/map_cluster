Gem::Specification.new do |s|
  s.name        = 'map_cluster'
  s.version     = '0.1.0'
  s.summary     = "Map cluster"
  s.description = "Cluster map points."
  s.authors     = ["Lukasz Kaczmarek"]
  s.email       = 'luke@dreamcode.pl'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  s.homepage    = 'http://rubygems.org/gems/map_cluster'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'geocoder', '~> 1.6', '>= 1.6.1'
  s.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
end
