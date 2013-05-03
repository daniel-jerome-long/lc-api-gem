module LcApi
  class Message < Resource
    ATTRIBUTES = %w[id title part length series_id speaker_id resource_url youversionlive_id date_released formats series speaker]
    define_attribute_methods(ATTRIBUTES)
  end
end