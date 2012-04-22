module HttpHelper
  require 'htmlentities'
  require 'nokogiri'
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

    def extract_text_from_html(content)
      doc = Nokogiri::HTML(content)
      c = doc.xpath("//text()").remove.to_s
      HTMLEntities.new.decode c
    end
  end
end

