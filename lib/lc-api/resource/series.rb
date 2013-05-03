module LcApi
  class Series < Resource
    ATTRIBUTES = %w[id title description hashtag slug parts promo viewable start_date end_date messages]
    define_attribute_methods(ATTRIBUTES)
  end
end