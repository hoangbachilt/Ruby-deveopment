class UsersController < ApplicationController
  before_action :authorized, except: [:create]

  def create
    @form = RegistrationsForm.new user_params
    if @form.save!
      render json: @form
    else
      render json: { error: "Post is invalid", status: 400 }, status: 200
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end


end