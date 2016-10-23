class CreateTicketOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_options do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :seats
      t.string :status

      t.timestamps
    end
  end
end
