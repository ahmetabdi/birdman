class Birdman::Genre < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :name, :slug ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Get a list of all genres, including names and slugs.
  # Possible values: movies, shows
  def self.list(type)
    Birdman::Requester.get("genres/#{type}")
  end

end