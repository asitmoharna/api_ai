require 'json'
module ApiAi
  module Request
    [:get, :post, :put, :delete].each do |http_method|
      define_method http_method do |path, options={}, raw=false|
        request(http_method, path, options, raw)
      end
    end

    private

    def request(method, path, options, raw=false)
      response = connection(raw).send(method) do |request|
        request.url path
        request['Authorization'] = "Bearer #{access_token}"
        request['Content-Type'] = 'application/json; charset=utf-8'
        request.body = JSON.generate(options) unless options.empty?
      end

      response.body
    end
  end
end
