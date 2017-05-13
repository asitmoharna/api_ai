module ApiAi
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Override the default options with given options
    def initialize(options={})
      options = ApiAi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Returns the set of config that are set
    def config
      conf = {}
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end
  end
end
