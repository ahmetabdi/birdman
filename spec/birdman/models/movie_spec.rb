require 'spec_helper'

describe Birdman::Movie do

  describe "#find" do
    subject(:movie) { Birdman::Movie.find("tron-legacy-2010") }

    it "should set the attribute title" do
      expect(movie.title).to eq("TRON: Legacy")
    end

    it "should set the attribute year" do
      expect(movie.year).to eq(2010)
    end

    it "should set the ids" do
      expect(movie.ids.trakt).to eq(12601)
      expect(movie.ids.slug).to eq("tron-legacy-2010")
      expect(movie.ids.imdb).to eq("tt1104001")
      expect(movie.ids.tmdb).to eq(20526)
    end

  end

  describe ".aliases" do
    subject(:movie) { Birdman::Movie.find("tron-legacy-2010") }
    subject(:aliases) { movie.aliases }

    it "should" do
      puts aliases
    end

  end


  # [:upcoming, :now_playing, :popular, :top_rated].each do |endpoint|
  #   describe ".#{endpoint}" do
  #     subject(:movies) { Enceladus::Movie.send(endpoint) }
  #     let(:response) { build(:movie_collection_response) }

  #     before do
  #       stub_request(:get, /api.themoviedb.org\/3\/movie\/#{endpoint}/).to_return(status: 200, body: response.to_json)
  #     end

  #     it "should return a Enceladus::MovieCollection" do
  #       is_expected.to be_kind_of(Enceladus::MovieCollection)
  #     end

  #     it "should fetch #{endpoint} movies" do
  #       movie = response.results.first
  #       expect(movies.all.map(&:id)).to include movie.id
  #     end
  #   end
  # end

end