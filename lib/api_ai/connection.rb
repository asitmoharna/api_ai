require 'faraday'

module ApiAi
  module Connection
    private

    def connection(raw=false)
      # options = {
      #   "headers" => {
      #      'Accept' => "application/#{format}; charset=utf-8",
      #      'User-Agent' => user_agent,
      #      'Authorization' => "Bearer #{access_token}",
      #      'Content-Type' => "application/#{format}"
      #   },
      #   "url" => endpoint
      # }.merge(connection_options)

      # Faraday::Connection.new(options) do |conn|
      api_endpoint = [endpoint, api_version, '/'].join
      Faraday::Connection.new(api_endpoint) do |conn|
        conn.use Faraday::Adapter::NetHttp
      end
    end
  end
end
