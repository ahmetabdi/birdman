require 'spec_helper'

describe Birdman::Movie do

  describe "#list" do
    subject(:movie_genres) { Birdman::Genre.list("movies") }
    subject(:show_genres) { Birdman::Genre.list("shows") }

    it "should set the attribute title" do
      # expect(movie.title).to eq("TRON: Legacy")
      # raise movie_genres.inspect
      # raise show_genres.inspect
    end

  end

end