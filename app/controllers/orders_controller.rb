class OrdersController < ApplicationController
  before_action :set_order

  def index
    @orders = Order.where(user: current_user).where.not(status: 'draft').order(:created_at)
    @admin_orders = Order.all.where.not(status: 'draft').order(:created_at)
  end

  def show
    @order_items = @order.order_items.order(:created_at)
  end

  def edit; end

  def update
    @order.update(order_params.merge(status: :in_progress))
    OrderMailer.with(user: current_user, order_items: @order.order_items, order: @order).place_an_order.deliver_now
    redirect_to root_path, notice: 'Your order was successfully created.'
  end

  def complete
    @order = Order.find(params[:id])
    @order.completed!
    OrderMailer.with(user: current_user, order_items: @order.order_items, order: @order).complete_an_order.deliver_now
    redirect_to root_path, notice: 'The order was successfully completed.'
  end

  def cancel
    @order = Order.find(params[:id])
    @order.canceled!
    OrderMailer.with(user: current_user, order_items: @order.order_items, order: @order).cancel_an_order.deliver_now
    redirect_to root_path, notice: 'The order was successfully canceled.'
  end

  def destroy
    @order.destroy
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
