require 'httparty'

module LcApi
  class API
    class << self
      def get(uri, options)
        uri = LcApi.base_uri + uri
        appends = ""
        options.each { |k,v| appends << "&#{k}=#{(v.is_a?(Array) ? v.join(",") : v)}" }
        HTTParty.get("#{uri}?key=#{LcApi.key}#{appends}")
      end
    end
    
    class ResponseError < StandardError; end
    class NotFound < ResponseError; end
    class Forbidden < ResponseError; end
    class InternalServerError < ResponseError; end
  end
end