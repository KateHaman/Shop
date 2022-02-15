class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total_price
    self.quantity * self.product.price
  end

  def item_quantity
    self.quantity * 100
  end
end
