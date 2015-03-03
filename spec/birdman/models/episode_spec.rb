require 'spec_helper'

describe Birdman::Episode do
  let(:episode) { VCR.use_cassette("episodes/find") do
    Birdman::Episode.find("the-flash-2014",1,1)
  end }

  describe "#find" do
    it "should set the attribute title" do
      raise episode.inspect
    end
  end

end