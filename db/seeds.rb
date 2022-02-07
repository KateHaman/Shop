require 'faker'

50.times do
  Product.create(
    title: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    price: Faker::Number.decimal(l_digits: 2)
  )
end

10.times do
  Category.create(
    title: Faker::Coffee.variety
  )
end
