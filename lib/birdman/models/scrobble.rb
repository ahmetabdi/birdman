# Scrobbling is a seemless and automated way to track what you're watching in a media center.
# The media center should send events that correspond
# to starting, pausing, and stopping (or finishing) watching a movie or episode.
class Birdman::Scrobble < Birdman::ApiResource

  # Use this method when the video intially starts playing or is unpaused.
  # This will remove any playback progress if it exists.
  # 🔒 OAuth Required
  def self.start
    Birdman::Requester.post("scrobble/start", {}, {
      :movie => movie, # movie or episode object.
      :progress => progress.to_f, # progress percentage between 0 and 100.
      :app_version => app_version.to_s, # version number of the app.
      :app_date => app_date.to_s # build date of the app
    })
  end

  # Use this method when the video is paused.
  # The playback progress will be saved and GET /sync/playback can be used
  # to resume the video from this exact position.
  # Unpause a video by calling the GET /scrobble/start method again.
  # 🔒 OAuth Required
  def self.pause
    Birdman::Requester.post("scrobble/pause", {}, {
      :movie => movie, # movie or episode object.
      :progress => progress.to_f, # progress percentage between 0 and 100.
      :app_version => app_version.to_s, # version number of the app.
      :app_date => app_date.to_s # build date of the app
    })
  end


  # Use this method when the video is stopped or finishes playing on its own. If the progress is above 80%, the video will be scrobbled and the action will be set to scrobble.If the progress is less than 80%, it will be treated as a pause and the action will be set to pause. The playback progress will be saved and GET /sync/playback can be used to resume the video from this exact position.
  # 🔒 OAuth Required
  def self.stop
    Birdman::Requester.post("scrobble/stop", {}, {
      :movie => movie, # movie or episode object.
      :progress => progress.to_f, # progress percentage between 0 and 100.
      :app_version => app_version.to_s, # version number of the app.
      :app_date => app_date.to_s # build date of the app
    })
  end

end