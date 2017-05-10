require 'spec_helper'

RSpec.describe MapCluster do
  describe "#add_coordinate" do
    it "Add two coordinates to one cluster" do
      map_cluser = MapCluster.new()
      cluster_1 = MapCluster::Coordinate.new(52.9527002, 17.9814142)
      cluster_2 = MapCluster::Coordinate.new(52.9527002, 17.9814142)
      expect(map_cluser.add_coordinate(cluster_1)).to be_a Array
      expect(map_cluser.add_coordinate(cluster_2)).to be_a Array
      expect(map_cluser.clusters.count).to eq 1
    end

    it "Add two coordinates to separated clusters" do
      map_cluser = MapCluster.new()
      cluster_1 = MapCluster::Coordinate.new(52.9527002, 17.9814142)
      cluster_2 = MapCluster::Coordinate.new(52.9527002, -17.9814142)
      expect(map_cluser.add_coordinate(cluster_1)).to be_a Array
      expect(map_cluser.add_coordinate(cluster_2)).to be_a Array
      expect(map_cluser.clusters.count).to eq 2
    end
  end
end
