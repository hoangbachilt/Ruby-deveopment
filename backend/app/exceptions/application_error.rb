class ApplicationError < StandardError
  def to_hash
    {
      message: message,
      status: http_status
    }
  end

  def http_status
    500
  end
end
