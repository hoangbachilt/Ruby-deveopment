class CreateImageLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :image_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true
      t.integer :operation_type

      t.timestamps
    end
  end
end
