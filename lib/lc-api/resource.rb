require 'json'
require 'active_support/inflector'

module LcApi
  class Resource
    class << self
      
      def find(id, options={})
        uri = member_name
        uri += "/#{id}" if id
        parse_response(API.get(uri, options))
      end
      
      def all(options={})
        uri = member_name
        parse_response(API.get(uri, options), true)
      end
      
      def parse_response(response, multiple=false)
        case response.code.to_i
        when 404
          raise LcApi::API::NotFound.new(response), "Resource was not found"
        when 403
          raise LcApi::API::Forbidden.new(response), "Forbidden"
        when 500
          raise LcApi::API::InternalServerError.new(response), "500 Internal Server error"
        end
        
        return build_record(response.parsed_response) unless multiple
        
        resources = []
        response.parsed_response.each do |rec|
          resources.push build_record(rec)
        end
        return resources
      end
      
      def build_record(response)
        attributes = {}
        response.each_pair do |key, val|
          attributes[key] = val if @attributes.include? key
        end
        new(attributes)
      end
      
      def member_name
        name.split('::').last.downcase.pluralize
      end
      
      def define_attribute_methods(attributes)
        @attributes = attributes
        
        @attributes.each do |name|
          define_method(name) { self[name] }
        end
      end
    end
    
    attr_accessor :attributes
    
    def initialize attributes = {}
      raise Error, "#{self.class} is an abstract class and cannot be instantiated" if instance_of? Resource
      @attributes = {}
      self.attributes = attributes
    end
    
    def [](key)
      @attributes[key]
    end
    
    def []=(key,value)
      @attributes[key] = value if self.respond_to?(key)
    end
    
    def attributes=(attributes = {})
      attributes.each_pair do |key, val|
        self[key] = val
      end
    end
    
  end
end