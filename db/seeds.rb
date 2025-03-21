# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cart = Cart.create!
Discount.create!(discountable: cart, price_limit: 1000)

product_data = {
  'Беспроводная колонка Goodyear Bluetooth Speaker' => 1600,
  'Женский домашний костюм Sweet Dreams'           => 800,
  'Плащ-дождевик SwissOak'                           => 800
}

products = product_data.map do |name, price|
  product = Product.create!(name: name)
  Stock.create!(product: product, price: price, quantity: rand(5..10))
  product
end

products.each.with_index(1) do |product, index|
  image_path = Rails.root.join('public', "#{index}.jpeg")
  product.images.attach(
    io: File.open(image_path),
    filename: "#{index}.jpeg",
    content_type: 'image/jpeg'
  )
end

products.each do | product |
  cart.picked_products.create!(product:, quantity: rand(1..3))
end
