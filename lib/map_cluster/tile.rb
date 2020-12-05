class MapCluster::Tile

  attr_reader :zoom, :tile_size
  attr_accessor :x, :y

  def initialize(zoom = 12, tile_size = 256)
    @tile_size = tile_size
    @zoom = zoom
  end

end
