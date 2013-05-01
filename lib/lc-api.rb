require 'lc-api/api'
require 'lc-api/resource'
require 'lc-api/resource/message'
require 'lc-api/resource/series'
require 'lc-api/resource/speaker'
require 'lc-api/resource/location'
require 'lc-api/resource/staff'
require 'lc-api/resource/category'

module LcApi
  class << self
    attr_accessor :key, :base_uri
    
    def base_uri
      @base_uri || 'http://0.0.0.0:3000/v1/'
    end
    
  end
end