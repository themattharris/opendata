module HttpHelper
  require 'typhoeus'

  class << self
    def make_request(url, params={}, method=:get)
      request = Typhoeus::Request.new(
        url,
        :method        => method,
        :cache_timeout => 60, # seconds
        :params        => params
      )
      request(request)
    end

    def request(request)
      hydra = Typhoeus::Hydra.new
      hydra.queue(request)
      hydra.run

      request.response
    end
  end
end

