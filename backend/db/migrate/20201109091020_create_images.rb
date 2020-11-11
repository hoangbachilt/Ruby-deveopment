class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.string :title
      t.string :extension
      t.string :size

      t.timestamps
    end
  end
end
