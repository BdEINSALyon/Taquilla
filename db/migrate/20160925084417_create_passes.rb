class CreatePasses < ActiveRecord::Migration[5.0]
  def change
    create_table :passes do |t|
      t.string :name
      t.decimal :price
      t.integer :seats
      t.string :status
      t.text :description
      t.datetime :entry_start
      t.datetime :entry_closed
      t.datetime :pass_start
      t.datetime :pass_end

      t.timestamps
    end
  end
end
