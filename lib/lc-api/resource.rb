require 'json'
require 'active_support/inflector'
require_relative 'error_codes'

module LcApi
  class Resource
    class << self
      include ErrorCodes
           
      def find(id, options={})
        uri = member_name # ie 'message'
        uri += "/#{id}" if id
        parse_response(API.get(uri, options))
      end
      
      def all(options={})
        uri = member_name # get name of resource
        parse_response(API.get(uri, options), true)
      end
      
      def parse_response(response, multiple=false)
        error_code_check(response) # from ErrorCodes mixin
        
        # build a single record and return if there is only one resource (via ".find" method)
        return build_record(response.parsed_response) unless multiple
        
        # otherwise, build multiple records for multiple resources (via ".all" method)
        resources = []
        response.parsed_response.each { |rec| resources.push build_record(rec) }
        return resources
      end
      
      def build_record(response)
        attributes = {}
        response.each_pair { |k,v| attributes[k] = v if @attributes.include? k }
        new(attributes)
      end
      
      def member_name
        name.split('::').last.downcase.pluralize # pluralize from active_support/inflector
      end
      
      def define_attribute_methods(attributes)
        @attributes = attributes
        @attributes.each { |name| define_method(name) { self[name] }}
      end
    end
    
    attr_accessor :attributes
    
    def initialize attributes = {}
      # raise error if user attempts to initialize a Resource by calling new
      raise Error, "#{self.class} is an abstract class and cannot be instantiated" if instance_of? Resource
      @attributes = {}
      self.attributes = attributes # "attributes=" called
    end
    
    def [](k) # "self[]" called externally, like so: "message.title" -- getter for keys and values (self[])
      @attributes[k]
    end
    
    def []=(k,v) # called internally -- setter for keys and values
      @attributes[k] = v if self.respond_to?(k)
    end
    
    def attributes=(attributes = {})
      attributes.each_pair { |k, v| self[k] = v } # []= method call
    end
    
  end
end