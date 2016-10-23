class AddPassToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :pass_id, :integer
  end
end
