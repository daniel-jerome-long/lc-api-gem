require 'httparty'

module LcApi
  class API
    class << self
      def get(uri, options)
        uri = LcApi.base_uri + uri
        opts = ""
        options.each { |k,v| opts << "&#{k}=#{(v.is_a?(Array) ? v.join(",") : v)}" }
        HTTParty.get("#{uri}?key=#{LcApi.key}#{opts}")
      end
    end
    
    # error code response classes
    class ResponseError < StandardError; end
    class BadRequest < ResponseError; end
    class Unauthorized < ResponseError; end
    class Forbidden < ResponseError; end
    class NotFound < ResponseError; end
    class Gone < ResponseError; end
    class InternalServerError < ResponseError; end
    class BadGateway < ResponseError; end
    class ServiceUnavailable < ResponseError; end
    class GatewayTimeout < ResponseError; end
    
  end
end