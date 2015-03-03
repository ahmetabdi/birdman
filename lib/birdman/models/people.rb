class Birdman::Movie < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :name, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  def self.find(id)
    build_single_resource(Birdman::Requester.get("people/#{id}", {}), id)
  end

  def movies
    Birdman::Requester.get("people/#{id}/movies")
  end

  def shows
    Birdman::Requester.get("people/#{id}/shows")
  end

end