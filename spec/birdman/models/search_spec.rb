require 'spec_helper'

describe Birdman do

  describe ".search" do

    describe "Searching using a query" do
      subject(:search_results) { Birdman.search(query: "matrix", type: 'movie') }

      it "should return an array of related results" do
        expect(search_results).to be_kind_of(Array)
      end

      it "should return a type" do
        expect(search_results.first.type).to eq("movie")
      end

      it "should return a score" do
        expect(search_results.first.score).to eq(28.896248)
      end
    end

  end

end