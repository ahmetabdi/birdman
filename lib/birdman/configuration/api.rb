require 'singleton'

module Birdman::Configuration
  class Api
    include Singleton

    attr_reader :base_url, :version, :client_id,
                :client_secret, :access_token, :redirect_uri, :oauth_url

    def initialize
      self.base_url = "https://api-v2launch.trakt.tv".freeze
      self.oauth_url = "https://trakt.tv/".freeze
      self.version = 2.freeze
    end

    def connect(client_id, client_secret, redirect_uri="urn:ietf:wg:oauth:2.0:oob")
      begin
        self.client_id = client_id
        self.client_secret = client_secret
        self.redirect_uri = redirect_uri
        authorise!
        true
      rescue Birdman::Exception::Api
        self.client_id = nil
        self.client_secret = nil
        self.redirect_uri = nil
        false
      end
    end

    # This will return the URL to retrieve the OAuth2 Authorization Code
    def authorize_url
      client = OAuth2::Client.new(client_id, client_secret, :site => oauth_url)
      client.auth_code.authorize_url(:redirect_uri => redirect_uri)
    end

    # This will set the access token from the OAuth Authorization Code which gets passed in
    # After authorising all calls to the API should be succsessful
    def authorise!
      begin
        response = Birdman::Requester.post("oauth/token", {}, {
          :client_id => "#{client_id}",
          :client_secret => "#{client_secret}",
          :grant_type => "client_credentials"
        })
        self.access_token = response.access_token
        true
      rescue Birdman::Exception::Api
        self.access_token = nil
        false
      end
    end

    def url_for(action, params={})
      # params[:api_key] = api_key
      url = URI.join(base_url, action)
      url.query = URI.encode_www_form(params) if params
      url.to_s
    end

    private
      attr_writer :base_url, :version, :client_id, :client_secret, :access_token, :redirect_uri, :oauth_url

  end
end

# Client ID:
# 326c4d41f98b24ab6ba0d38b3c3e638f9fb319973f9245b8f785741b474f7d2d

# Client Secret:
# 5e4a37e2cc78529661edf367489ac5929a13396c63e53c0f217d65027b5c8bbd