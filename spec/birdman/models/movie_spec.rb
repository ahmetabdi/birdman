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

    it "should have a title" do
      expect(aliases.first.title).to eq("Tron 2.0")
    end

    it "should hae a country" do
      expect(aliases.first.country).to eq("us")
    end
  end

  describe ".releases" do
    subject(:movie) { Birdman::Movie.find("tron-legacy-2010") }
    subject(:releases) { movie.releases }

    it "should have a country" do
      expect(releases.first.country).to eq("us")
    end

    it "should have a certification" do
      expect(releases.first.certification).to eq("PG")
    end

    it "should have a release date" do
      expect(releases.first.release_date).to eq("2010-12-16")
    end
  end

  describe ".translations" do
  end

  describe ".comments" do
  end

  describe ".people" do
  end

  describe ".ratings" do
  end

  describe ".related" do
  end

  describe ".stats" do
  end

  describe ".watching" do
  end

  describe "#popular" do
  end

  describe "#trending" do
  end

  describe "#updates" do
  end

end