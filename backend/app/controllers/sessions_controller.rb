class SessionsController < ApplicationController
  before_action :authorized, except: [:create]

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end