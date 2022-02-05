class PagesController < ApplicationController

  def home
    @products = Product.order(title: :asc).page(params[:page])
  end
end
