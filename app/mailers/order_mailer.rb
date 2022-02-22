class OrderMailer < ApplicationMailer
  def place_an_order
    @user = params[:user]
    @order_items = params[:order_items]
    @order = params[:order]
    mail(to: @user.email, subject: 'Your order is in progress.')
  end

  def complete_an_order
    @user = params[:user]
    @order_items = params[:order_items]
    @order = params[:order]
    mail(to: @user.email, subject: 'Your order has been sent.')
  end

  def cancel_an_order
    @user = params[:user]
    @order_items = params[:order_items]
    @order = params[:order]
    mail(to: @user.email, subject: 'Your order has been canceled.')
  end
end
