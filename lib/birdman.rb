require 'oauth2'
require "birdman/version"
require "birdman/configuration/api"
require "birdman/requester"
require "birdman/exceptions"
require "birdman/models/api_resource"
require "birdman/models/api_paginated_collection"
require "birdman/models/genre"
require "birdman/models/show"
require "birdman/models/movie"

module Birdman

  def self.connect(client_id, client_secret, options={})
    Birdman::Configuration::Api.instance.tap do |api|
      api.connect(client_id, client_secret)
    end
  end

  # RESOURCE_ATTRIBUTES = [ :name, :slug ]

  # attr_accessor *RESOURCE_ATTRIBUTES

  # Searches can use queries or ID lookups. Queries will search fields like the title and description.
  # ID lookups are helpful if you have an external ID and want to get the trakt ID and info.
  # This method will search for movies, shows, episodes, people, and lists.

  # Perform a text query that searches titles, descriptions, translated titles, aliases, and people.
  # Items searched include movies, shows, episodes, people, and lists.
  # Results are ordered by the most relevant score.
  #
  # You can optionally limit the type of results to return.
  # Send a comma separated string to get results for multiple types.
  # You can optionally filter the year for movie and show results.
  #
  # Paginated
  def self.search(opts={})
    params = Hash.new.tap do |hash|
      hash['query'] = opts[:query] if opts[:query] # Example: batman.
      hash['type'] = opts[:type] if opts[:type] # Possible values: movie, show, episode, person, list.
      hash['year'] = opts[:year] if opts[:year] # Example: 2015.
    end
    Birdman::Requester.get("search", params)
  end

end