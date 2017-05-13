module ApiAi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :access_token,
      :develper_token,
      :client_id,
      :client_secret,
      :endpoint,
      :format,
      :api_version,
      :user_agent,
      :connection_options
    ].freeze

    DEFAULT_ACCESS_TOKEN = nil
    DEFAULT_DEVELOPER_TOKEN = nil
    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_SECRET = nil
    DEFAULT_ENDPOINT = 'https://api.api.ai/'.freeze
    DEFAULT_FORMAT = :json
    DEFAULT_API_VERSION = 'v1'
    DEFAULT_USER_AGENT = "ApiAi Ruby Gem #{ApiAi::VERSION}"
    DEFAULT_CONNECTION_OPTIONS = {}

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def reset
      self.access_token = DEFAULT_ACCESS_TOKEN
      self.develper_token = DEFAULT_DEVELOPER_TOKEN
      self.client_id = DEFAULT_CLIENT_ID
      self.client_secret = DEFAULT_CLIENT_SECRET
      self.endpoint = DEFAULT_ENDPOINT 
      self.format = DEFAULT_FORMAT
      self.api_version = DEFAULT_API_VERSION
      self.user_agent = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def configure
      yield self
    end
  end
end
