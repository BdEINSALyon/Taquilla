class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :code
      t.text :description
      t.integer :seats
      t.decimal :amount_off
      t.decimal :percent_off
      t.integer :event_id

      t.timestamps
    end
  end
end
