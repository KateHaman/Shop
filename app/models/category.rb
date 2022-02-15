class Category < ApplicationRecord
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  has_many :products

  validates :title, presence: true
end
