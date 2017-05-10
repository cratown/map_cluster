require 'spec_helper'

RSpec.describe MapCluster::Cluster do

  describe "#average_center" do
    it "Return [0,0] on new object" do
      expect(MapCluster::Cluster.new.average_center).to eq [0, 0]
    end

    it "Return coordinate position on one coordinate" do
      mc = MapCluster::Cluster.new
      mc.add_coordinate(MapCluster::Coordinate.new(1, 1))
      expect(mc.average_center).to eq [1, 1]
    end

    it "Return coordinate position fror 2 coordinates" do
      mc = MapCluster::Cluster.new
      mc.add_coordinate(MapCluster::Coordinate.new(1, 1))
      mc.add_coordinate(MapCluster::Coordinate.new(2, 2))
      expect(mc.average_center).to eq [1.5, 1.5]
    end
  end

  describe "#real_bounds" do
    it "Return bounds on position on one coordinate" do
      mc = MapCluster::Cluster.new
      mc.add_coordinate(MapCluster::Coordinate.new(1, 1))
      expect(mc.real_bounds).to eq({sw: [1, 1], ne: [1, 1]})
    end

    it "Return bounds position fro 2 coordinates" do
      mc = MapCluster::Cluster.new
      mc.add_coordinate(MapCluster::Coordinate.new(1, 2))
      mc.add_coordinate(MapCluster::Coordinate.new(3, 4))
      expect(mc.real_bounds).to eq({sw: [1, 2], ne: [3, 4]})
    end
  end

end
