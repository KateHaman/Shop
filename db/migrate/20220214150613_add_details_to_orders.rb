class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders,:total
    remove_column :orders,:subtotal
    add_column :orders, :status, :integer, default: 0
  end
end
