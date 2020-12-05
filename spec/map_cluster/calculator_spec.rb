require 'spec_helper'

RSpec.describe MapCluster::Calculator do
  describe '#coordinate_to_tile' do
    it "updates tile coordinates" do
      lat = 0
      lon = 0
      coordinate = MapCluster::Coordinate.new(lat, lon)
      tile = MapCluster::Tile.new
      calculator = MapCluster::Calculator.new
      tile = calculator.coordinate_to_tile(coordinate, tile)
      expect([tile.x, tile.y]).to eq [2048, 2048]
    end
  end

  describe '#coordinate_to_pixel' do
    it "updates pixels coordinates" do
      lat = 0
      lon = 0
      coordinate = MapCluster::Coordinate.new(lat, lon)
      tile = MapCluster::Tile.new
      pixel = MapCluster::Pixel.new
      calculator = MapCluster::Calculator.new
      new_pixel = calculator.coordinate_to_pixel(coordinate, pixel, tile)
      expect([pixel.x, pixel.y]).to eq [524288, 524288]
    end
  end

  describe '#pixel_to_coordinates' do
    it "updates coordinate latitude and longitude" do
      pixel_x = 524288
      pixel_y = 524288
      coordinate = MapCluster::Coordinate.new(80, 170)
      tile = MapCluster::Tile.new
      pixel = MapCluster::Pixel.new(pixel_x, pixel_y)
      calculator = MapCluster::Calculator.new
      new_pixel = calculator.pixel_to_coordinates(pixel, coordinate, tile)
      expect([coordinate.latitude, coordinate.longitude]).to eq [0, 0]
    end
  end

  describe '#tile_to_coordinates' do
    it "updates coordinate latitude and longitude" do
      tile_x = 2048
      tile_y = 2048
      coordinate = MapCluster::Coordinate.new(80, 170)
      tile = MapCluster::Tile.new
      tile.x = tile_x
      tile.y = tile_y
      calculator = MapCluster::Calculator.new
      new_pixel = calculator.tile_to_coordinates(tile, coordinate)
      expect([coordinate.latitude, coordinate.longitude]).to eq [0, 0]
    end
  end
end
