class TransactionsController < ApplicationController
before_action :authorized

  def index
    users = User.all
    render json: users
  end

end