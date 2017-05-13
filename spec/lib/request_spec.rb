require File.expand_path('../../spec_helper', __FILE__)

describe ApiAi::Request do
  before do
    @client = ApiAi::Client.new(access_token: 'somes3cr3taccesstoken')
  end

  describe '#get' do
    it 'makes a get request to the given path' do
      stub_request(:get, 'https://api.api.ai/v1/entities')
      @client.get('entities')
      expect(WebMock).to have_requested :get, 'https://api.api.ai/v1/entities'
    end
  end

  describe '#post' do
    context 'without request body' do
      it 'makes a post request to the given path' do
        stub_request(:post, 'https://api.api.ai/v1/entities')
        @client.post('entities')
        expect(WebMock).to have_requested(:post, 'https://api.api.ai/v1/entities').
          with(body:{})
      end
    end
    context 'with request body' do
      it 'makes a post request to the given path and parameter' do
        stub_request(:post, 'https://api.api.ai/v1/entities')
        @client.post('entities', {name: 'Something'})
        expect(WebMock).to have_requested(:post, 'https://api.api.ai/v1/entities').
          with(body: {name: 'Something'})
      end
    end
  end

  describe '#put' do
    context 'without request body' do
      it 'makes a put request to the given path' do
        stub_request(:put, 'https://api.api.ai/v1/entities/cafebabe')
        @client.put('entities/cafebabe')
        expect(WebMock).to have_requested(:put, 'https://api.api.ai/v1/entities/cafebabe').
          with(body:{})
      end
    end
    context 'with request body' do
      it 'makes a put request to the given path and parameter' do
        stub_request(:put, 'https://api.api.ai/v1/entities/cafebabe')
        @client.put('entities/cafebabe', {name: 'Something'})
        expect(WebMock).to have_requested(:put, 'https://api.api.ai/v1/entities/cafebabe').
          with(body: {name: 'Something'})
      end
    end
  end

  describe '#delete' do
    context 'without request body' do
      it 'makes a delete request to the given path' do
        stub_request(:delete, 'https://api.api.ai/v1/entities/deadbeef')
        @client.delete('entities/deadbeef')
        expect(WebMock).to have_requested(:delete, 'https://api.api.ai/v1/entities/deadbeef').
          with(body:{})
      end
    end
  end
end
