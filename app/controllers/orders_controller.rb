class OrdersController < ApplicationController
  before_action :set_order

  def show
    @order_items = @order.order_items
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  def edit; end

  def update
    @order.in_progress!
    @order.update(order_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :user_id, :name, :email, :delivery_info)
  end

  def set_order
    @order = current_order
  end
end
