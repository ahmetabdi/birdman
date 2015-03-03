# Recommendations are based on the watched history for a user and their friends.
 # There are other factors that go into the algorithm as well to further personalize what gets recommended.
class Birdman::Recommendation < Birdman::ApiResource

  # Personalized movie recommendations for a user.
  # Results returned with the top recommendation first.
  # 🔒 OAuth Required
  def self.all_movies
    Birdman::Requester.get("recommendations/movies")
  end

  # Dismiss a movie from getting recommended anymore.
  # 🔒 OAuth Required
  def self.dismiss_movie(id)
    Birdman::Requester.delete("recommendations/movies/#{id}")
  end

  # Personalized show recommendations for a user. Results returned with the top recommendation first.
  # 🔒 OAuth Required
  def self.all_shows
    Birdman::Requester.get("recommendations/shows")
  end

  # Dismiss a show from getting recommended anymore.
  # 🔒 OAuth Required
  def self.dismiss_show(id)
    Birdman::Requester.delete("recommendations/shows/#{id}")
  end

end