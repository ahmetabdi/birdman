require 'oauth2'
require "birdman/version"
require "birdman/configuration/api"
require "birdman/requester"
require "birdman/exceptions"

module Birdman

  def self.connect(client_id, client_secret, options={})
    Birdman::Configuration::Api.instance.tap do |api|
      api.connect(client_id, client_secret)
    end
  end

end