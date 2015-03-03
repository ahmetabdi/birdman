# One or more genres are attached to all movies and shows.
# Some API methods allow filtering by genre, so it's good to cache this list in your app.
class Birdman::Genre < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :name, :slug ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Get a list of all genres, including names and slugs.
  # Possible values:  movies, shows.
  def self.list(type)
    Birdman::Requester.get("genres/#{type}")
  end

end