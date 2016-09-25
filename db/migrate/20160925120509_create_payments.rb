class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :status
      t.string :method
      t.decimal :amount
      t.string :pid
      t.text :data
      t.integer :cart_id

      t.timestamps
    end
  end
end
