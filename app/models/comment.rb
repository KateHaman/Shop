class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates_presence_of :body, :rating
end
