class Birdman::Episode < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :season, :number, :title, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Returns a single episode's details.
  # All date and times are in UTC and were calculated using the episode's air_date and show's country and air_time.
  # Note: If the first_aired is unknown, it will be set to null.
  def self.find(id, season=1, episode=1)
    build_single_resource(Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}", {}), id)
  end

  # Returns all top level comments for an episode. Most recent comments returned first.
  # 📄 Pagination
  def comments
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/comments")
  end

  # Returns rating (between 0 and 10) and distribution for an episode.
  def ratings
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/ratings")
  end

  # Returns lots of episode stats including ratings breakdowns, scrobbles, checkins, collections, lists, and comments
  # COMING SOON™
  def stats
    raise NotImplementedError
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/stats")
  end

  # Returns all users watching this episode right now.
  def watching
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/watching")
  end

end