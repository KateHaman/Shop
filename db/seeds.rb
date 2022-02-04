require 'faker'

20.times do
  Product.create(
    title: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    price: Faker::Number.decimal,
    image: Faker::LoremPixel.image,
  )
end

20.times do
  Category.create(
    title: Faker::Coffee.variety,
  )
end
