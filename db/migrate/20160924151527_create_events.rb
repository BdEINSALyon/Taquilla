class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :seats
      t.integer :organization_id

      t.timestamps
    end
  end
end
