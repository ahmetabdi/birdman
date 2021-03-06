# By default, the calendar will return all shows or movies for the specified time period.
# The start_date defaults to today and days to 7.
# If OAuth is sent, the items returned will be limited to what the user has watched, collected, or added to their watchlist.
# You'll most likely want to send OAuth to make the calendar more relevant to the user.
class Birdman::Calendar < Birdman::ApiResource

  # Returns all shows airing during the time period specified.
  # 🔓 OAuth Optional
  def self.shows(start_date=Time.now, days=1)
    Birdman::Requester.get("calendars/shows/#{start_date.strftime("%Y-%m-%d")}/#{days}")
  end

  # Returns all new show premieres (season 1, episode 1) airing during the time period specified.
  # 🔓 OAuth Optional
  def self.new_shows(start_date=Time.now, days=1)
    Birdman::Requester.get("calendars/shows/new/#{start_date.strftime("%Y-%m-%d")}/#{days}")
  end

  # Returns all show premieres (any season, episode 1) airing during the time period specified.
  # 🔓 OAuth Optional
  def self.season_premieres(start_date=Time.now, days=1)
    # calendars/shows/premieres/start_date/days
    Birdman::Requester.get("calendars/shows/premieres/#{start_date.strftime("%Y-%m-%d")}/#{days}")
  end

  # Returns all movies with a release date during the time period specified.
  # 🔓 OAuth Optional
  def self.movies(start_date=Time.now, days=1)
    Birdman::Requester.get("calendars/shows/#{start_date.strftime("%Y-%m-%d")}/#{days}")
  end

end