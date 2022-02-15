require 'faker'

10.times { Category.create(title: Faker::Coffee.variety) }

50.times do
  Product.create(
    title: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    price: Faker::Number.decimal(l_digits: 2),
    category_id: Category.all.sample.id
  )
end
