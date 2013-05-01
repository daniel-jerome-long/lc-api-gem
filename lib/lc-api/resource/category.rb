module LcApi
  class Category < Resource
    ATTRIBUTES = %w[id name]
    define_attribute_methods(ATTRIBUTES)
  end
end