class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :user_id

      t.timestamps
    end
    create_join_table :passes, :invitations
  end
end
