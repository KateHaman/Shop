class OrderMailerPreview < ActionMailer::Preview
  def place_an_order
    OrderMailer.with(user: User.last, order_items: Order.last.order_items, order: Order.last).place_an_order
  end
end
