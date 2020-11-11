class CreateFolderLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :folder_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true
      t.integer :operation_type

      t.timestamps
    end
  end
end
