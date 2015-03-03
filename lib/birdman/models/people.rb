class Birdman::Movie < Birdman::ApiResource

  RESOURCE_ATTRIBUTES = [ :id, :name, :ids ]

  attr_accessor *RESOURCE_ATTRIBUTES

  # Returns a single person's details.
  def self.find(id)
    build_single_resource(Birdman::Requester.get("people/#{id}", {}), id)
  end

  # Returns all movies where this person is in the cast or crew.
  # Each cast object will have a character and a standard movie object.
  # The crew oject will be broken up into production, art, crew, costume & make-up, directing, writing, sound, and camera
  # (if there are people for those crew positions).
  # Each of those members will have a job and a standard movie object.
  def movies
    Birdman::Requester.get("people/#{id}/movies")
  end

  # Returns all movies where this person is in the cast or crew.
  # Each cast object will have a character and a standard show object.
  # The crew oject will be broken up into production, art, crew, costume & make-up, directing, writing, sound, and camera
  # (if there are people for those crew positions).
  # Each of those members will have a job and a standard show object.
  def shows
    Birdman::Requester.get("people/#{id}/shows")
  end

end