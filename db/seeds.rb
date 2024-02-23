# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating users...'
User.create!(email: 'user1@example.com', password: 'Password123')
User.create!(email: 'user2@example.com', password: 'Password123')
User.create!(email: 'user3@example.com', password: 'Password123')

User.all.each do |user|
  puts "Creating ingredients for #{user.email}..."

  puts 'Creating breads...'
  Ingredient.create!(user: user, ingredient_type: :bread, name: 'White Bun', price_cents: 50)
  Ingredient.create!(user: user, ingredient_type: :bread, name: 'Wheat Bun', price_cents: 75)
  Ingredient.create!(user: user, ingredient_type: :bread, name: 'Texas Toast', price_cents: 100)
  Ingredient.create!(user: user, ingredient_type: :bread, name: 'Lettuce Bun', price_cents: 25)

  puts 'Creating patties...'
  Ingredient.create!(user: user, ingredient_type: :patty, name: 'Beef', price_cents: 100)
  Ingredient.create!(user: user, ingredient_type: :patty, name: 'Brisket', price_cents: 150)
  Ingredient.create!(user: user, ingredient_type: :patty, name: 'Wagyu', price_cents: 175)
  Ingredient.create!(user: user, ingredient_type: :patty, name: 'Beyond Meat', price_cents: 200)

  puts 'Creating cheeses...'
  Ingredient.create!(user: user, ingredient_type: :cheese, name: 'American', price_cents: 10)
  Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Cheddar', price_cents: 10)
  Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Swiss', price_cents: 10)
  Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Provolone', price_cents: 10)

  puts 'Creating toppings...'
  Ingredient.create!(user: user, ingredient_type: :topping, name: 'Lettuce', price_cents: 25)
  Ingredient.create!(user: user, ingredient_type: :topping, name: 'Tomato', price_cents: 25)
  Ingredient.create!(user: user, ingredient_type: :topping, name: 'Onion', price_cents: 25)
  Ingredient.create!(user: user, ingredient_type: :topping, name: 'Pickle', price_cents: 25)

  puts 'Creating sauces...'
  Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Mayo', price_cents: 0)
  Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Mustard', price_cents: 0)
  Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Honey Mustard', price_cents: 0)
  Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Ketchup', price_cents: 0)
  Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Tabasco', price_cents: 0)

  puts "Creating orders for #{user.email}..."

  if user.id == 1
    1000.times do |n|
      puts "Creating orders ##{n}..."

      bread = Ingredient.where(user: user, ingredient_type: :bread).all.sample
      patty = Ingredient.where(user: user, ingredient_type: :patty).all.sample
      cheese = Ingredient.where(user: user, ingredient_type: :cheese).all.sample
      topping = Ingredient.where(user: user, ingredient_type: :topping).all.sample
      sauce = Ingredient.where(user: user, ingredient_type: :sauce).all.sample

      order = Order.create!(user: user, name: "Order #{n}")

      OrderIngredient.create!(order: order, ingredient: bread, price_cents: rand(100..200))
      OrderIngredient.create!(order: order, ingredient: patty, price_cents: rand(100..200))
      OrderIngredient.create!(order: order, ingredient: cheese, price_cents: rand(100..200))
      OrderIngredient.create!(order: order, ingredient: topping, price_cents: rand(100..200))
      OrderIngredient.create!(order: order, ingredient: sauce, price_cents: rand(100..200))

      total_cents = order.reload.order_ingredients.sum(:price_cents)
      order.update!(total_cents: total_cents)
    end
  end
end
