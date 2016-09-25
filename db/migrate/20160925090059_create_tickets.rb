class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
