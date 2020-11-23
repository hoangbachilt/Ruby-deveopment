class BadRequest < ApplicationError
  def http_status
    400
  end
end
