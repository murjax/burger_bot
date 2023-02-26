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
end
