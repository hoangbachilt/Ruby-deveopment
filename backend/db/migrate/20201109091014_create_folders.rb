class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
