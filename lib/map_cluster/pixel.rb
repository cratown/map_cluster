# Simple Pixel class
class MapCluster::Pixel

  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    self.x, self.y = x, y
  end

end
