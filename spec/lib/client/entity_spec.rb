require File.expand_path('../../../spec_helper', __FILE__)

describe ApiAi::Client do
  describe '.create_entity' do
    before do
      ApiAi.configure do |config|
        ApiAi::Configuration::VALID_OPTIONS_KEYS.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    it 'creates the entity' do
      @client = ApiAi::Client.new(access_token: 'somes3cr3t', endpoint: 'https://api.api.ai/', api_version: 'v1')
      stub_request(:post, "https://api.api.ai/v1/entities")

      @client.create_entity('Category', entries: [{value: 'Car', synonyms: ['Car','Cab','Taxi']}])

      expect(WebMock).to have_requested(:post, "https://api.api.ai/v1/entities")
    end
  end

  describe '.entities' do
    before do
      ApiAi.configure do |config|
        ApiAi::Configuration::VALID_OPTIONS_KEYS.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    it 'lists entities' do
      @client = ApiAi::Client.new(access_token: 'somes3cr3t', endpoint: 'https://api.api.ai/', api_version: 'v1')
      stub_request(:get, "https://api.api.ai/v1/entities")

      @client.entities

      expect(WebMock).to have_requested(:get, "https://api.api.ai/v1/entities")
    end
  end

  describe '.entity' do
    before do
      ApiAi.configure do |config|
        ApiAi::Configuration::VALID_OPTIONS_KEYS.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    it 'get an entity' do
      @client = ApiAi::Client.new(access_token: 'somes3cr3t', endpoint: 'https://api.api.ai/', api_version: 'v1')
      stub_request(:get, "https://api.api.ai/v1/entities/deadbeef")

      @client.entity('deadbeef')

      expect(WebMock).to have_requested(:get, "https://api.api.ai/v1/entities/deadbeef")
    end
  end
end
