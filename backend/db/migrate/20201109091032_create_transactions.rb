class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :login_time
      t.datetime :logout_time
    end
  end
end
