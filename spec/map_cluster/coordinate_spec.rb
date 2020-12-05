require 'spec_helper'

RSpec.describe MapCluster::Coordinate do
  describe '#to_coordinates' do
    it "returns coordinates in good order" do
      lat = rand(-90.0...90.0)
      lon = rand(-180.0...180.0)
      coordinate = MapCluster::Coordinate.new(lat, lon)

      expect(coordinate.to_coordinates).to eq [lat, lon]
    end
  end
end
