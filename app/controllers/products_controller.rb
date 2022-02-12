class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.search(params[:search]).page(params[:page])
    @categories = Category.all
    @category = params.dig(:product, :category_id)
    @products = @products.where(category_id: @category) if @category
    @order = params.dig(:product, :order)
    @products = if @order && @order == 'Name: A to Z'
                  @products.title_a_to_z
                elsif @order && @order == 'Name: Z to A'
                  @products.title_z_to_a
                elsif @order && @order == 'Price: High to Low'
                  @products.price_high_to_low
                elsif @order && @order == 'Price: Low to High'
                  @products.price_low_to_high
                else
                  @products.order(title: :asc)
                end
    @price_info = params.dig(:product, :price_info)
    @products = if @price_info && @price_info == 'Less than 25 UAH'
                  @products.less_than_twenty_five
                elsif @price_info && @price_info == '25-50 UAH'
                  @products.twenty_five_to_fifty
                elsif @price_info && @price_info == '50-75 UAH'
                  @products.fifty_to_seventy_five
                elsif @price_info && @price_info == 'More than 75 UAH'
                  @products.more_than_seventy_five
                else
                  @products.order(title: :asc)
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def products_params
    params.require(:product).permit(:title, :description, :price)
  end
end
