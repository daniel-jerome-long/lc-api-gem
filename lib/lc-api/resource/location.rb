module LcApi
  class Location < Resource
    ATTRIBUTES = %w[id slug facebook_id street_1 street_2 city state zip latitude longitude phone email date_founded]
    define_attribute_methods(ATTRIBUTES)
  end
end