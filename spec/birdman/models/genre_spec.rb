require 'spec_helper'

describe Birdman::Movie do

  describe "#list" do

    describe "movie genres" do
      subject(:movie_genres) { Birdman::Genre.list("movies") }

      it "should return an array of movie generes" do
        expect(movie_genres).to be_kind_of(Array)
      end

      it "should return a name for a movie genre" do
        expect(movie_genres.first.name).to eq("Action")
      end

      it "should return a slug for a movie genre" do
        expect(movie_genres.first.slug).to eq("action")
      end
    end

    describe "tv show genres" do
      subject(:show_genres) { Birdman::Genre.list("shows") }

      it "should return an array of tv show generes" do
        expect(show_genres).to be_kind_of(Array)
      end

      it "should return a name for a movie genre" do
        expect(show_genres.first.name).to eq("Action")
      end

      it "should return a slug for a movie genre" do
        expect(show_genres.first.slug).to eq("action")
      end
    end

  end

end