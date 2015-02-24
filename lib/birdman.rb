require 'oauth2'
require "birdman/version"
require "birdman/configuration/api"
require "birdman/requester"
require "birdman/exceptions"

module Birdman

  def self.connect(client_id, access_token, options={ include_image_language: "en", include_adult: false })
    Birdman::Configuration::Api.instance.tap do |api|
      api.connect(client_id, access_token)
      api.include_adult = options[:include_adult]
    end
  end

end