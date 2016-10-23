class LinkTicketOptions < ActiveRecord::Migration[5.0]
  def change
    create_join_table :ticket_options, :tickets
    create_join_table :ticket_options, :passes
    add_column :ticket_options, :event_id, :integer
  end
end
