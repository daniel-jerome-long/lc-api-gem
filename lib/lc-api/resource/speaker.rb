module LcApi
  class Speaker < Resource
    ATTRIBUTES = %w[id name bio org_url org_name personal_url]
    define_attribute_methods(ATTRIBUTES)
  end
end