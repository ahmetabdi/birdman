require 'spec_helper'

describe Birdman do

  describe ".connect" do
    subject { Birdman.connect(client_id, access_token) }
    let(:client_id) { "326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d" }
    let(:access_token) { "cc835a35c2b3cd63684ec50dc435d098d7107632afc0e893e35a4b2b4dfdf6b2" }

    it "should start the configuration workflow" do
      subject
    end

  end
end