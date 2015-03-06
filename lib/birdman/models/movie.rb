class Birdman::Movie < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :title, :year, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Returns a single movie's details.
  def self.find(id)
    build_single_resource(Birdman::Requester.get("movies/#{id}", {}), id)
  end

  # Returns all title aliases for a movie. Includes country where name is different.
  def aliases
    Birdman::Requester.get("movies/#{id}/aliases")
  end

  # [Optional] 2 character country code Example: us. (String)
  # Returns all releases for a movie including country, certification, and release date.
  def releases(country = nil)
    Birdman::Requester.get("movies/#{id}/releases/#{country}")
  end

  # [Optional] 2 character language code Example: es. (String)
  # Returns all translations for a movie, including language and translated values for title, tagline and overview.
  def translations(language = nil)
    Birdman::Requester.get("movies/#{id}/translations/#{language}")
  end

  # Returns all top level comments for a movie. Most recent comments returned first.
  # 📄 Pagination
  def comments
    Birdman::ApiPaginatedCollection.new("movies/#{id}/comments")
  end

  # Returns all cast and crew for a movie.
  def people
    Birdman::Requester.get("movies/#{id}/people")
  end

  # Returns rating (between 0 and 10) and distribution for a movie.
  def ratings
    Birdman::Requester.get("movies/#{id}/ratings")
  end

  # Returns related and similar movies. By default, 10 related movies will returned. You can send a limit to get up to 100 items.
  def related
    Birdman::Requester.get("movies/#{id}/related")
  end

  # Returns lots of show stats including ratings breakdowns, scrobbles, checkins, collections, lists, and comments.
  # COMING SOON™
  def stats
    raise NotImplementedError
    Birdman::Requester.get("movies/#{id}/stats")
  end

  # Returns all users watching this show right now.
  def watching
    Birdman::Requester.get("movies/#{id}/watching")
  end

  # Returns the most popular movies. Popularity is calculated using the rating percentage and the number of ratings.
  # 📄 Pagination
  def self.popular
    Birdman::Requester.get("movies/popular")
  end

  # Returns all movies being watched right now. Movies with the most users are returned first.
  # 📄 Pagination
  def self.trending
    Birdman::Requester.get("movies/trending")
  end

  # Returns all movies updated since the specified UTC date. We recommended storing the date you can be efficient using this method moving forward.
  # 📄 Pagination
  def self.updates(start_date=Time.now)
    Birdman::Requester.get("movies/updates/#{start_date.strftime("%Y-%m-%d")}")
  end
end
