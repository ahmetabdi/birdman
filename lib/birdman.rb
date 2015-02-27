require 'oauth2'
require "birdman/version"
require "birdman/configuration/api"
require "birdman/requester"
require "birdman/exceptions"
require "birdman/models/api_resource"
require "birdman/models/movie"
require "birdman/models/genre"
require "birdman/models/search"
require "birdman/models/show"

module Birdman

  def self.connect(client_id, client_secret, options={})
    Birdman::Configuration::Api.instance.tap do |api|
      api.connect(client_id, client_secret)
    end
  end

end