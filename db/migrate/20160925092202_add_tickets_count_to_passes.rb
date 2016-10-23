class AddTicketsCountToPasses < ActiveRecord::Migration[5.0]
  def change
    add_column :passes, :tickets_count, :integer
  end
end
