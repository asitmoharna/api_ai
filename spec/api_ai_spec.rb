require 'spec_helper'

describe ApiAi do
  it 'has a version number' do
    expect(ApiAi::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  describe '.configure' do
    ApiAi::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "can configure key - #{key}" do
        ApiAi.configure do |config|
          config.send("#{key}=", key)
          expect(ApiAi.send(key)).to eq(key)
        end
      end
    end
  end
end
