class Birdman::Episode < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :season, :number, :title, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  def self.find(id, season=1, episode=1)
    build_single_resource(Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}", {}), id)
  end

  def comments
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/comments")
  end

  def ratings
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/ratings")
  end

  def stats
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/stats")
  end

  def watching
    Birdman::Requester.get("shows/#{id}/seasons/#{season}/episodes/#{episode}/watching")
  end

end