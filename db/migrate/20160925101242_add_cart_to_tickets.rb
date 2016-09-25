class AddCartToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :cart_id, :integer
  end
end
