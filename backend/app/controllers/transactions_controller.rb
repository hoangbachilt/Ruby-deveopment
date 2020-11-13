class TransactionsController < ApplicationController
  before_action :authorized, except: :create

  def create
    transaction = Transaction.new transaction_params
    render json: transaction if transaction.save
  end

  def index
    transaction = Transaction.all.limit(5)
    render json: transaction
  end

  def update
    transaction = Transaction.find params[:id]
    transaction.update logout_time: Time.zone.now
    render json: transaction
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :login_time, :logout_time)
  end
end
