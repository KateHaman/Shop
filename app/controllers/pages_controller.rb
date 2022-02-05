class PagesController < ApplicationController

  def home
    @products = Product.order(created_at: :desc).page(params[:page])
  end
end
