class AddDetailsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :parent, index: true
  end
end
