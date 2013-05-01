module ErrorCodes
  
  def error_code_check(response)
    case response.code.to_i
    when 400
      raise LcApi::API::BadRequest.new(response), "The request was invalid."
    when 401
      raise LcApi::API::Unauthorized.new(response), "Authentication credentials were missing or incorrect."
    when 403
      raise LcApi::API::Forbidden.new(response), "The request is understood, but it has been refused or access is not allowed."
    when 404
      raise LcApi::API::NotFound.new(response), "The URI requested is invalid or the resource requested does not exist."
    when 410
      raise LcApi::API::Gone.new(response), "This resource is gone. This indicates that an API endpoint has been turned off."
    when 500
      raise LcApi::API::InternalServerError.new(response), "Something is broken. Please let the API Team know so that we can investigate."
    when 502
      raise LcApi::API::BadGateway.new(response), "The LifeChurch.tv API is down or is being upgraded."
    when 503
      raise LcApi::API::ServiceUnavailable.new(response), "The LifeChurch.tv API servers are up, but overloaded with requests. Try again later."
    when 504
      raise LcApi::API::GatewayTimeout.new(response), "The LifeChurch.tv API servers are up, but the request couldn't be serviced due to some failure within the stack. Try again later."
    end
  end
  
end