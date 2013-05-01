module LcApi
  class Staff < Resource
    ATTRIBUTES = %w[id name role email facebook_id location_id]
    define_attribute_methods(ATTRIBUTES)
  end
end