require 'rest_client'
require 'ostruct'

class Birdman::Requester
  class << self
    # Makes a get request to one of the TMDb API endpoints.
    # Example:
    #
    #   Enceladus::Requester.get("account", { session_id: "43462867" })
    #
    # Performing this action might results in RestClient::Exception.
    # Check out https://github.com/rest-client/rest-client#exceptions-see-wwww3orgprotocolsrfc2616rfc2616-sec10html for more details.
    #
    def get(action, params={})
      url = api.url_for(action, params)
      perform_request do
        parse_response(RestClient.get(url, request_headers))
      end
    end

    # Makes a post request to TMDb API endpoints.
    # Example:
    #
    #   params = { session_id: "77678687" }
    #   form_data = { media_type: "movie", media_id: 31231, watchlist: true }
    #   Enceladus::Requester.post("account/777/watchlist", params, form_data)
    #
    # Performing this action might results in RestClient::Exception.
    # Check out https://github.com/rest-client/rest-client#exceptions-see-wwww3orgprotocolsrfc2616rfc2616-sec10html for more details.
    #
    def post(action, params={}, form_data={})
      url = api.url_for(action, params)
      perform_request do
        parse_response(RestClient.post(url, form_data.to_json, request_headers))
      end
    end

    def delete(action)
      url = api.url_for(action)
      perform_request do
        parse_response(RestClient.post(url, {}, request_headers))
      end
    end

  private
    def api
      Birdman::Configuration::Api.instance
    end

    # Handles request calls exceptions.
    # Performing RestClient actions might results in RestClient::Exception.
    # Check out https://github.com/rest-client/rest-client#exceptions-see-wwww3orgprotocolsrfc2616rfc2616-sec10html for more details.
    #
    # So, this method is responsible for handling RestClient::Exception, parsing the error message to finally raise Enceladus::Exception::Api.
    #
    def perform_request(&block)
      begin
        block.call
      rescue RestClient::Exception => e
        message = if e.http_body.strip.empty?
          e
        else
          message = ["Exception:"]
          message << "@message=\"#{e.message}\""

          JSON.parse(e.http_body).each do |k,v|
            message << "@#{k}=\"#{v}\""
          end
          message.join(" ")
        end
        raise Birdman::Exception::Api.new(message).inspect
      end
    end

    def request_headers
      Hash.new.tap do |headers|
        headers['Accept'] = 'application/json'
        headers['Content-Type'] = 'application/json'
        headers['trakt-api-version'] = api.version
        headers['trakt-api-key'] = api.client_id
        headers['Authorization'] = "Bearer #{api.access_token}" if api.access_token
      end
    end

    def parse_response(response_body)
      begin
        JSON.parse(response_body, object_class: OpenStruct)
      rescue JSON::ParserError => e
        raise Enceladus::Exception::JsonParseError.new("Response body could not be parsed: #{e.message}")
      end
    end
  end
end