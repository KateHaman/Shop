class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  enum status: %i[draft in_progress ordered canceled]

  def subtotal
    order_items.map(&:total_price).sum
  end
end
