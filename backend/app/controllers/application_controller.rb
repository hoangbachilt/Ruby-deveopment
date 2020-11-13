class ApplicationController < ActionController::API
  rescue_from ApplicationError, with: :reponse_error
  rescue_from ActionController::ParameterMissing, with: :params_missing

  private

  def reponse_error error
    render json: error.to_hash, status: error.http_status
  end

  def params_missing
    reponse_error MissingParameter.new
  end

  def response_success(message=nil)
    render json:
    {
      success: {
        message: message,
        status: status
      }
    }
  end
end
