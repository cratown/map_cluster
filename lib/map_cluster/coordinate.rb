class MapCluster::Coordinate

  attr_accessor :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude, @longitude = latitude, longitude
  end

  def to_coordinates
    [@latitude, @longitude]
  end
end
