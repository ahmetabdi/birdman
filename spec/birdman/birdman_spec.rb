require 'spec_helper'

describe Birdman do

  describe ".connect" do
    subject { Birdman.connect(client_id, client_secret) }
    let(:client_id) { "326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d" }
    let(:client_secret) { "5e4a37e2cc78529661edf367489ac5929a13396c63e53c0f217d65027b5c8bbd" }

    it "should start the configuration workflow" do
      subject
      puts subject.popular_movies
    end

  end
end