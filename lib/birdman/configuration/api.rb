require 'singleton'

module Birdman::Configuration
  class Api
    include Singleton

    attr_reader :base_url, :version, :client_id, :access_token
    attr_accessor :include_adult

    def initialize
      self.base_url = "https://api-v2launch.trakt.tv".freeze
      self.version = 2.freeze
      self.include_adult = false
      self.client_id = "326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d"

      # raise token = client.auth_code.get_token('authorization_code_value', :headers => {'Authorization' => 'Basic some_password'})
      # if they give us just an client_id that meant they have an approved app
      # unapproved apps must request oauth to work
    end

    def connect(client_id, access_token)
      begin
        self.client_id = client_id
        self.access_token = access_token
        Birdman::Requester.get("movies/popular")
        # Birdman::Requester.post("oauth/token", {}, {
        #   :code => "1c8b0870a72d94e96e4fd281a83362ffb57b38f11eb3e3bc0daae67d34d4c2fa",
        #   :client_id => "326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d",
        #   :client_secret => "5e4a37e2cc78529661edf367489ac5929a13396c63e53c0f217d65027b5c8bbd",
        #   :redirect_uri => "urn:ietf:wg:oauth:2.0:oob",
        #   :grant_type => "authorization_code"
        # })
        true
      rescue Birdman::Exception::Api
        self.client_id = nil
        self.access_token = nil
        false
      end
    end

    # def authorize_url
    #   client = OAuth2::Client.new('326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d', '5e4a37e2cc78529661edf367489ac5929a13396c63e53c0f217d65027b5c8bbd', :site => 'https://trakt.tv/')
    #   client.auth_code.authorize_url(:redirect_uri => 'urn:ietf:wg:oauth:2.0:oob')
    # end

    def url_for(action, params={})
      # params[:api_key] = api_key
      url = URI.join(base_url, action)
      # url.query = URI.encode_www_form(params)
      url.to_s
    end

    private
      attr_writer :base_url, :version, :client_id, :access_token

  end
end

# Client ID:
# 326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d

# Client Secret:
# 5e4a37e2cc78529661edf367489ac5929a13396c63e53c0f217d65027b5c8bbd