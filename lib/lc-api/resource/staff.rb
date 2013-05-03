module LcApi
  class Staff < Resource
    ATTRIBUTES = %w[id name role email facebook_id location_id location]
    define_attribute_methods(ATTRIBUTES)
  end
end