Gem::Specification.new do |s|
  s.name        = 'map_cluster'
  s.version     = '0.0.0'
  s.date        = '2016-03-18'
  s.summary     = "Map cluster"
  s.description = "Cluster map points."
  s.authors     = ["Lukasz Kaczmarek"]
  s.email       = 'luke@dreamcode.pl'
  s.files       = ["lib/map_cluster.rb", "lib/map_cluster/tile.rb", "lib/map_cluster/pixel.rb", "lib/map_cluster/coordinate.rb", "lib/map_cluster/calculator.rb", "lib/map_cluster/cluster.rb"]
  s.homepage    = 'http://rubygems.org/gems/map_cluster'
  s.license     = 'MIT'

  s.add_runtime_dependency 'geocoder'
  s.add_development_dependency 'rspec'
end
