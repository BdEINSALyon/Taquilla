class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :location
      t.string :contact_email
      t.string :website
      t.text :description
      t.integer :parent_organization_id

      t.timestamps
    end
    create_join_table :admin_users, :organizations
  end
end
