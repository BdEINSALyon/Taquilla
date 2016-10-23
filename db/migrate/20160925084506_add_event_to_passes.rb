class AddEventToPasses < ActiveRecord::Migration[5.0]
  def change
    add_column :passes, :event_id, :integer
  end
end
