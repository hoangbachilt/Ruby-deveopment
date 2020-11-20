class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :folder, null: false, foreign_key: true
      t.references :sender
      t.references :recipent
      t.boolean :status

      t.timestamps
    end
    add_index :invitations, [:sender_id, :recipent_id, :folder_id], unique: true
  end
end
