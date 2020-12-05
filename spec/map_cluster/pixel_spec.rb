require 'spec_helper'

RSpec.describe MapCluster::Pixel do

  it "position is readable" do
    x = rand(0...1_000_000)
    y = rand(0...1_000_000)
    pixel = MapCluster::Pixel.new(x, y)

    expect(pixel.x).to eq x
    expect(pixel.y).to eq y
  end
end
