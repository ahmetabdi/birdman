require 'spec_helper'

describe Birdman::Show do
  let(:show) { VCR.use_cassette("shows/id") do
    Birdman::Show.find("the-flash-2014")
  end }

  describe "#find" do
    it "should set the attribute title" do
      expect(show.title).to eq("The Flash")
    end

    it "should set the attribute year" do
      expect(show.year).to eq(2014)
    end

    it "should set the ids" do
      expect(show.ids.trakt).to eq(60300)
      expect(show.ids.slug).to eq("the-flash-2014")
      expect(show.ids.imdb).to eq("tt3107288")
      expect(show.ids.tmdb).to eq(60735)
    end
  end

  describe ".aliases" do
    subject(:aliases) { VCR.use_cassette("shows/aliases") do
      show.aliases
    end }
    it "Shows/aliases currently has no data from trakts API check back later"
  end

  describe ".translations" do
    subject(:translations) { VCR.use_cassette("shows/translations") do
      show.translations
    end }

    it "should have a title" do
      expect(translations.first.title).to eq("The Flash")
    end

    it "should have a overview" do
      expect(translations.first.overview).to eq("Młody naukowiec w wyniku eksplozji laboratorium i porażenia piorunem zostaje obdarzony niesamowitą szybkością, którą wykorzystuje do walki ze złem.")
    end

    it "should have a tagline" do
      expect(translations.first.tagline).to eq(nil)
    end

    it "should have a language" do
      expect(translations.first.language).to eq("pl")
    end
  end

  describe ".comments" do
    subject(:comments) { VCR.use_cassette("shows/comments") do
      show.comments
    end }

    it { should be_kind_of(Birdman::ApiPaginatedCollection) }

    it "should have an id" do
      expect(comments.first.id).to eq(38481)
    end

    it "should have an comment" do
      expect(comments.first.comment).to be_kind_of(String)
    end

    it "should have an spoiler" do
      expect(comments.first.spoiler).to eq(false)
    end

    it "should have an review" do
      expect(comments.first.review).to eq(false)
    end

    it "should have an parent_id" do
      expect(comments.first.parent_id).to eq(0)
    end

    it "should have an created_at" do
      expect(comments.first.created_at).to eq("2015-02-19T04:29:05.000Z")
    end

    it "should have an replies" do
      expect(comments.first.replies).to eq(0)
    end

    it "should have an likes" do
      expect(comments.first.likes).to eq(0)
    end

    it "should have an username" do
      expect(comments.first.user.username).to eq("chadmein")
    end

    it "should have a name" do
      expect(comments.first.user.name).to eq("")
    end

    it "should have a private flag" do
      expect(comments.first.user.private).to eq(false)
    end

    it "should have a vip flag" do
      expect(comments.first.user.vip).to eq(false)
    end
  end

  # describe ".people" do
  #   subject(:people) { VCR.use_cassette("shows/people") do
  #     movie.people
  #   end }

  #   it "should return cast members" do
  #     expect(people.cast).to be_kind_of(Array)
  #   end
  # end

  # describe ".ratings" do
  #   subject(:ratings) { VCR.use_cassette("shows/ratings") do
  #     movie.ratings
  #   end }

  #   it "should return a rating" do
  #     expect(ratings.rating).to eq(7.49677)
  #   end

  #   it "should return vote count" do
  #     expect(ratings.votes).to eq(5723)
  #   end
  # end

  # describe ".related" do
  #   subject(:related) { VCR.use_cassette("shows/related") do
  #     movie.related
  #   end }

  #   it "should return an array of related movies" do
  #     expect(movie.related).to be_kind_of(Array)
  #   end
  # end

  # describe ".stats" do
  #   subject(:stats) { VCR.use_cassette("shows/stats") do
  #     movie.stats
  #   end }

  #   it "should return watcher count" do
  #     expect(stats.watchers).to eq(26539)
  #   end

  #   it "should return play counts" do
  #     expect(stats.plays).to eq(25366)
  #   end

  #   it "should return collection counts" do
  #     expect(stats.collection).to eq(16459)
  #   end

  #   it "should return list count" do
  #     expect(stats.lists).to eq(1749)
  #   end

  #   it "should return comment counts" do
  #     expect(stats.comments).to eq(34)
  #   end
  # end

  # describe ".watching" do
  #   subject(:watching) { VCR.use_cassette("shows/watching") do
  #     movie.watching
  #   end }

  #   it "should return an array of users watching this movie" do
  #     expect(watching).to be_kind_of(Array)
  #   end
  # end

  # describe "#popular" do
  #   let(:popular) { VCR.use_cassette("shows/popular") do
  #     Birdman::Movie.popular
  #   end }

  #   it "should return an array of popular movies" do
  #     expect(popular).to be_kind_of(Array)
  #   end
  # end

  # describe "#trending" do
  #   let(:trending) { VCR.use_cassette("shows/trending") do
  #     Birdman::Movie.trending
  #   end }

  #   it "should return an array of trending movies" do
  #     expect(trending).to be_kind_of(Array)
  #   end
  # end

  # describe "#updates" do
  #   let(:updates) { VCR.use_cassette("shows/updates") do
  #     Birdman::Movie.updates
  #   end }

  #   it "should return an array of updated movies" do
  #     expect(updates).to be_kind_of(Array)
  #   end
  # end

end