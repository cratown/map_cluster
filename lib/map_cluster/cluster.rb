class MapCluster::Cluster
  attr_reader :coordinates
  attr_reader :zoom, :tile_size, :real_bounds

  def initialize(zoom: 12, tile_size: 256, distance_in_pixels: 60, calculator: MapCluster::Calculator.new)
    @zoom, @tile_size = [zoom, 3].max, tile_size
    @distance_in_pixels = distance_in_pixels
    @coordinates = []
    @calculator = calculator
  end

  def add_coordinate(coordinate)
    @average_center = calc_average_center(coordinate)
    calculate_real_bounds(coordinate)
    @coordinates << coordinate
  end

  def center
    @center ||= @coordinates.any? ? @coordinates.first.to_coordinates : [0, 0]
  end

  def average_center
    @average_center || center
  end

  def in_bounds?(coordinate)
    tile = MapCluster::Tile.new(@zoom, @tile_size)
    pixel = @calculator.coordinate_to_pixel(coordinate, MapCluster::Pixel.new, tile)
    pixels_bounds = extended_bounds_in_pixels(coordinate)
    pixel.x.between?(pixels_bounds.last.x, pixels_bounds.first.x) && pixel.y.between?(pixels_bounds.first.y, pixels_bounds.last.y)
  end

  def extended_bounds_in_pixels(coordinate)
    tmp_center = center #calc_average_center(coordinate)
    coordinate = MapCluster::Coordinate.new(tmp_center.first, tmp_center.last)
    pixel = MapCluster::Pixel.new
    tile = MapCluster::Tile.new(@zoom, @tile_size)
    pixel = @calculator.coordinate_to_pixel(coordinate, pixel, tile)
    ne_px = MapCluster::Pixel.new(pixel.x+@distance_in_pixels, pixel.y-@distance_in_pixels)
    sw_px = MapCluster::Pixel.new(pixel.x-@distance_in_pixels, pixel.y+@distance_in_pixels)
    [ne_px, sw_px]
  end

  private
  def calc_average_center(coordinate)
    return coordinate.to_coordinates if @coordinates.empty?
    l = @coordinates.count + 1;
    latitude = (@average_center.first * (l - 1) + coordinate.latitude) / l.to_f;
    longitude = (@average_center.last * (l - 1) + coordinate.longitude) / l.to_f;
    [latitude, longitude]
  end

  def calculate_real_bounds(coordinate)
    if @real_bounds
      @real_bounds[:ne][0] = coordinate.to_coordinates[0] if @real_bounds[:ne][0] < coordinate.to_coordinates[0]
      @real_bounds[:ne][1] = coordinate.to_coordinates[1] if @real_bounds[:ne][1] < coordinate.to_coordinates[1]
      @real_bounds[:sw][0] = coordinate.to_coordinates[0] if @real_bounds[:sw][0] > coordinate.to_coordinates[0]
      @real_bounds[:sw][1] = coordinate.to_coordinates[1] if @real_bounds[:sw][1] > coordinate.to_coordinates[1]
    else
      @real_bounds = {sw: coordinate.to_coordinates, ne: coordinate.to_coordinates}
    end
  end

end
