require 'httparty'

module LcApi
  class API
    class << self
      def method_missing(method_name, *args)
        super(method_name, args) unless [:get].include? method_name
        uri = LcApi.base_uri + args.shift
        appends = ""
        args.shift.each { |k,v| appends << "&#{k}=#{(v.is_a?(Array) ? v.join(",") : v)}" }
        HTTParty.get("#{uri}?key=#{LcApi.key}#{appends}")
      end
    end
    
    class ResponseError < StandardError
    end
    
    class NotFound < ResponseError
    end
    
    class Forbidden < ResponseError
    end
    
    class InternalServerError < ResponseError
    end
    
  end
end
