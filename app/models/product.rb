class Product < ApplicationRecord
  validates :title, :description, :price, presence: true

  def to_param
    return nil unless persisted?
    [id, title.parameterize].join("-")
  end
end
