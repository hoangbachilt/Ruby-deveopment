class UsersController < ApplicationController
  before_action :authorized, except: :create

  def create
    form = RegistrationsForm.new user_params
    render json: form if form.save!
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
