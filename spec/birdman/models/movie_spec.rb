require 'spec_helper'

describe Birdman::Movie do
  let(:movie) { VCR.use_cassette("movies/id") do
    Birdman::Movie.find("tron-legacy-2010")
  end }

  describe "#find" do
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
    subject(:aliases) { VCR.use_cassette("movies/aliases") do
      movie.aliases
    end }

    it "should have a title" do
      expect(aliases.first.title).to eq("Tron 2.0")
    end

    it "should hae a country" do
      expect(aliases.first.country).to eq("us")
    end
  end

  describe ".releases" do
    subject(:releases) { VCR.use_cassette("movies/releases") do
      movie.releases
    end }

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
    subject(:translations) { VCR.use_cassette("movies/translations") do
      movie.translations
    end }

    it "should have a title" do
      expect(translations.first.title).to eq("TRON: Legacy")
    end

    it "should have a overview" do
      expect(translations.first.overview).to eq("Sam Flynn, the tech-savvy and daring son of Kevin Flynn, investigates his father's disappearance and is pulled into The Grid. With the help of  a mysterious program named Quorra, Sam quests to stop evil dictator Clu from crossing into the real world.")
    end

    it "should have a tagline" do
      expect(translations.first.tagline).to eq("The Game Has Changed.")
    end

    it "should have a language" do
      expect(translations.first.language).to eq("en")
    end
  end

  # describe ".comments" do
  #   subject(:comments) { VCR.use_cassette("movies/comments") do
  #     movie.comments
  #   end }
  #
  #   it { should be_kind_of(Birdman::ApiPaginatedCollection) }
  #
  #   it "should have an id" do
  #     expect(comments.first.id).to eq(36281)
  #   end
  #
  #   it "should have an comment" do
  #     expect(comments.first.comment).to be_kind_of(String)
  #   end
  #
  #   it "should have an spoiler" do
  #     expect(comments.first.spoiler).to eq(false)
  #   end
  #
  #   it "should have an review" do
  #     expect(comments.first.review).to eq(false)
  #   end
  #
  #   it "should have an parent_id" do
  #     expect(comments.first.parent_id).to eq(0)
  #   end
  #
  #   it "should have an created_at" do
  #     expect(comments.first.created_at).to eq("2014-10-20T00:33:43.000Z")
  #   end
  #
  #   it "should have an replies" do
  #     expect(comments.first.replies).to eq(0)
  #   end
  #
  #   it "should have an likes" do
  #     expect(comments.first.likes).to eq(5)
  #   end
  #
  #   it "should have an username" do
  #     expect(comments.first.user.username).to eq("SeanMSU")
  #   end
  #
  #   it "should have a name" do
  #     expect(comments.first.user.name).to eq("")
  #   end
  #
  #   it "should have a private flag" do
  #     expect(comments.first.user.private).to eq(false)
  #   end
  #
  #   it "should have a vip flag" do
  #     expect(comments.first.user.vip).to eq(false)
  #   end
  # end

  describe ".people" do
    subject(:people) { VCR.use_cassette("movies/people") do
      movie.people
    end }

    it "should return cast members" do
      expect(people.cast).to be_kind_of(Array)
    end
  end

  describe ".ratings" do
    subject(:ratings) { VCR.use_cassette("movies/ratings") do
      movie.ratings
    end }

    it "should return a rating" do
      expect(ratings.rating).to eq(7.49591)
    end

    it "should return vote count" do
      expect(ratings.votes).to eq(5741)
    end
  end

  describe ".related" do
    subject(:related) { VCR.use_cassette("movies/related") do
      movie.related
    end }

    it "should return an array of related movies" do
      expect(movie.related).to be_kind_of(Array)
    end
  end

  describe ".stats" do
    subject(:stats) { VCR.use_cassette("movies/stats") do
      movie.stats
    end }

    it "should return watcher count" do
      expect(stats.watchers).to eq(26754)
    end

    it "should return play counts" do
      expect(stats.plays).to eq(25366)
    end

    it "should return collection counts" do
      expect(stats.collection).to eq(16459)
    end

    it "should return list count" do
      expect(stats.lists).to eq(1749)
    end

    it "should return comment counts" do
      expect(stats.comments).to eq(34)
    end
  end

  describe ".watching" do
    subject(:watching) { VCR.use_cassette("movies/watching") do
      movie.watching
    end }

    it "should return an array of users watching this movie" do
      expect(watching).to be_kind_of(Array)
    end
  end

  describe "#popular" do
    let(:popular) { VCR.use_cassette("movies/popular") do
      Birdman::Movie.popular
    end }

    it "should return an array of popular movies" do
      expect(popular).to be_kind_of(Array)
    end
  end

  describe "#trending" do
    let(:trending) { VCR.use_cassette("movies/trending") do
      Birdman::Movie.trending
    end }

    it "should return an array of trending movies" do
      expect(trending).to be_kind_of(Array)
    end
  end

  describe "#updates" do
    let(:updates) { VCR.use_cassette("movies/updates") do
      Birdman::Movie.updates
    end }

    it "should return an array of updated movies" do
      expect(updates).to be_kind_of(Array)
    end
  end

end
