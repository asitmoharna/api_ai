require File.expand_path('../../spec_helper', __FILE__)

describe ApiAi::Client do
  before do
    @keys = ApiAi::Configuration::VALID_OPTIONS_KEYS
  end

  context 'default initialization' do
    before do
      ApiAi.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      ApiAi.reset
    end

    it 'inherits default configuration' do
      client = ApiAi::Client.new
      @keys.each do |key|
        expect(client.send(key)).to eq(key)
      end
    end
  end

  context 'initialization with custom values' do
    before do
      @configuration = {
       access_token:  'somes3cr3taccess',
       develper_token: 'somethingelse',
       client_id:  'some_client_id',
       client_secret: 'some_client_secret',
       endpoint: 'api.somethingelse.com/v1',
       format:  :xml,
       api_version: 'v3',
       user_agent: 'crawler',
       connection_options: {proxy: true} 
      }
    end

    it 'overrides default configuration' do
      client = ApiAi::Client.new(@configuration)
      @keys.each do |key|
        expect(client.send(key)).to eq(@configuration[key])
      end
    end
  end

end

