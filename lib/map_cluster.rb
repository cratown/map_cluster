require 'geocoder'

class MapCluster

  attr_reader :clusters, :zoom, :tile_size

  def initialize(zoom: 12, tile_size: 256, distance_in_pixels: 60)
    @zoom, @tile_size = [zoom, 3].max, tile_size
    @distance_in_pixels = distance_in_pixels
    @clusters, @coordinates = [], []
  end

  def add_coordinate(coordinate)
    @coordinates << coordinate
    add_to_cluster(coordinate)
  end

  def clear
    @coordinates = []
    @clusters = []
  end

  private
  def add_to_cluster(coordinate)
    selected_cluster, max_distance = nil, nil
    @clusters.each do |cluster|
      distance = Geocoder::Calculations.distance_between(cluster.center, coordinate.to_coordinates)
      if max_distance.nil? || max_distance > distance
        max_distance = distance
        selected_cluster = cluster
      end
    end
    if selected_cluster && selected_cluster.in_bounds?(coordinate)
      selected_cluster.add_coordinate(coordinate)
    else
      cluster = MapCluster::Cluster.new(zoom: @zoom, tile_size: @tile_size, distance_in_pixels: @distance_in_pixels)
      cluster.add_coordinate(coordinate)
      @clusters << cluster
    end
  end
end

require 'map_cluster/tile'
require 'map_cluster/pixel'
require 'map_cluster/coordinate'
require 'map_cluster/calculator'
require 'map_cluster/cluster'
