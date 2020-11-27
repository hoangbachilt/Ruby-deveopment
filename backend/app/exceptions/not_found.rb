class NotFound < ApplicationError
  def http_status
    404
  end
end
