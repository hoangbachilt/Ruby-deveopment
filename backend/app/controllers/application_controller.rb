class ApplicationController < ActionController::API
  before_action :authorized
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

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      current_user = decoded_token[0]['current_user']
      @user = current_user
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
