class ApplicationError < StandardError
  def to_hash
    {
      message: message,
      code: http_status
    }
  end
end