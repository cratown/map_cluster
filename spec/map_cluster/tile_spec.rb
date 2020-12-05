require 'spec_helper'

RSpec.describe MapCluster::Tile do

  context 'default params' do
    it 'reads zoom' do
      tile = MapCluster::Tile.new
      expect(tile.zoom).to eq 12
    end

    it 'reads tile_size' do
      tile = MapCluster::Tile.new
      expect(tile.tile_size).to eq 256
    end

    it 'reads x' do
      tile = MapCluster::Tile.new
      expect(tile.x).to be_nil
    end

    it 'reads y' do
      tile = MapCluster::Tile.new
      expect(tile.y).to be_nil
    end
  end

  context 'passed params' do
    it 'reads zoom' do
      zoom = rand(1..11)
      tile = MapCluster::Tile.new(zoom)
      expect(tile.zoom).to eq zoom
    end

    it 'reads tile_size' do
      tile_size = rand(257..300)
      tile = MapCluster::Tile.new(12, tile_size)
      expect(tile.tile_size).to eq tile_size
    end
  end
end
