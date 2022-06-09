class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.string :jti
      t.references :user, null: false, foreign_key: true
      t.datetime :exp

      t.timestamps
    end
    add_index :blacklists, :jti, unique: true
  end
end
