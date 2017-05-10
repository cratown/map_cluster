class MapCluster::Tile

  attr_accessor :zoom, :x, :y, :tile_size

  def initialize(zoom = 12, tile_size = 256)
    self.tile_size = tile_size
    self.zoom = zoom
  end

end
