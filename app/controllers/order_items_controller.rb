class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[update destroy add_quantity reduce_quantity]

  def create
    order_item = current_order.order_items.find_by(product_id: params[:product_id])
    if order_item
      order_item.quantity += 1
      order_item.save
    else
      current_order.order_items.create(product_id: params[:product_id])
    end
    redirect_to order_path(current_order)
  end

  def destroy
    @order_item.destroy
    redirect_to order_path(current_order)
  end

  def add_quantity
    @order_item.quantity += 1
    @order_item.save
    redirect_to order_path(current_order)
  end

  def reduce_quantity
    if @order_item.quantity > 1
      @order_item.quantity -= 1
    end
    @order_item.save
    redirect_to order_path(current_order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :cart_id)
  end

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
end
