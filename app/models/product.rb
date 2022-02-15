class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  validates :title, :description, :price, presence: true

  def to_param
    return nil unless persisted?

    [id, title.parameterize].join('-')
  end

  def self.search(search)
    if search
      where('title ILIKE ?', "%#{search}%")
    else
      self
    end
  end

  def self.title_a_to_z
    Product.order(:title)
  end

  def self.title_z_to_a
    Product.order(title: :desc)
  end

  def self.price_low_to_high
    Product.order(:price)
  end

  def self.price_high_to_low
    Product.order(price: :desc)
  end

  def self.less_than_twenty_five
    Product.where('price < 25')
  end

  def self.twenty_five_to_fifty
    Product.where('price between 25 and 50')
  end

  def self.fifty_to_seventy_five
    Product.where('price between 50 and 75')
  end

  def self.more_than_seventy_five
    Product.where('price > 75')
  end
end
