class Birdman::Movie < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :title, :year, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Find a movie by trakt ID, trakt slug, or IMDB ID (String)
  # Examples:
  #   Birdman::Movie.find("550")
  #   Birdman::Movie.find("tron-legacy-2010")
  #   Birdman::Movie.find("tt0137523")
  #
  def self.find(id)
    build_single_resource(Birdman::Requester.get("movies/#{id}", {}), id)
  end

  def aliases
    Birdman::Requester.get("movies/#{id}/aliases")
  end

  def releases(country)
    # https://api-v2launch.trakt.tv/movies/id/releases/country
  end

  def translations(language)
    # https://api-v2launch.trakt.tv/movies/id/translations/language
  end

  def comments
    Birdman::Requester.get("movies/#{id}/comments")
  end

  def people
    Birdman::Requester.get("movies/#{id}/people")
  end

  def ratings
    Birdman::Requester.get("movies/#{id}/ratings")
  end

  def related
    Birdman::Requester.get("movies/#{id}/related")
  end

  def stats
    Birdman::Requester.get("movies/#{id}/stats")
  end

  def watching
    Birdman::Requester.get("movies/#{id}/watching")
  end

  def self.popular
    Birdman::Requester.get("movies/popular")
  end

  def self.trending
    Birdman::Requester.get("movies/trending")
  end

  def self.updates(start_date=Time.now)
    Birdman::Requester.get("movies/updates/#{start_date.strftime("%Y-%m-%d")}")
  end
end