class MapCluster::Calculator

  # Calculate tile position for given coordinates
  def coordinate_to_tile(coordinate, tile)
    tile_hash = coordinate_to_number(coordinate, tile)
    tile.x, tile.y = tile_hash[:x].to_i, tile_hash[:y].to_i
    tile
  end

  def coordinate_to_pixel(coordinate, pixel, tile)
    tile_hash = coordinate_to_number(coordinate, tile)
    pixel.x, pixel.y = (tile_hash[:x]*tile.tile_size).to_i, (tile_hash[:y]*tile.tile_size).to_i
    pixel
  end

  def pixel_to_coordinates(pixel, coordinate, tile)
    tile.x = pixel.x/tile.tile_size.to_f
    tile.y = pixel.y/tile.tile_size.to_f
    number_to_lat_lng(tile, coordinate)
  end

  def tile_to_coordinates(tile, coordinate)
    n = 2.0 ** tile.zoom
    coordinate.longitude = tile.x / n * 360.0 - 180.0
    lat_rad = Math::atan(Math::sinh(Math::PI * (1 - 2 * tile.y / n)))
    coordinate.latitude = 180.0 * (lat_rad / Math::PI)
    coordinate
  end

  private
  def coordinate_to_number(coordinate, tile)
    lat_rad = coordinate.latitude/180 * Math::PI
    n = 2.0 ** tile.zoom
    x = ((coordinate.longitude + 180.0) / 360.0 * n)
    y = ((1.0 - Math::log(Math::tan(lat_rad) + (1 / Math::cos(lat_rad))) / Math::PI) / 2.0 * n)
    {:x => x, :y =>y}
  end

end
