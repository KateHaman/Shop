class AddDetailsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :unit_price
    remove_column :order_items, :total

    change_column_default(
      :order_items,
      :quantity,
      from: nil,
      to: '1'
    )
  end
end
