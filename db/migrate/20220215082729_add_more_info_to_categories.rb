class AddMoreInfoToCategories < ActiveRecord::Migration[7.0]
  def change
    change_column_default(
      :categories,
      :parent_id,
      to: '0'
    )
  end
end
