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
  white_bun = Ingredient.create!(user: user, ingredient_type: :bread, name: 'White Bun', price_cents: 50)
  wheat_bun = Ingredient.create!(user: user, ingredient_type: :bread, name: 'Wheat Bun', price_cents: 75)
  texas_toast = Ingredient.create!(user: user, ingredient_type: :bread, name: 'Texas Toast', price_cents: 100)
  lettuce_bun = Ingredient.create!(user: user, ingredient_type: :bread, name: 'Lettuce Bun', price_cents: 25)

  puts 'Creating patties...'
  beef = Ingredient.create!(user: user, ingredient_type: :patty, name: 'Beef', price_cents: 100)
  brisket = Ingredient.create!(user: user, ingredient_type: :patty, name: 'Brisket', price_cents: 150)
  wagyu = Ingredient.create!(user: user, ingredient_type: :patty, name: 'Wagyu', price_cents: 175)
  beyond_meat = Ingredient.create!(user: user, ingredient_type: :patty, name: 'Beyond Meat', price_cents: 200)

  puts 'Creating cheeses...'
  american = Ingredient.create!(user: user, ingredient_type: :cheese, name: 'American', price_cents: 10)
  cheddar = Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Cheddar', price_cents: 10)
  swiss = Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Swiss', price_cents: 10)
  provolone = Ingredient.create!(user: user, ingredient_type: :cheese, name: 'Provolone', price_cents: 10)

  puts 'Creating toppings...'
  lettuce = Ingredient.create!(user: user, ingredient_type: :topping, name: 'Lettuce', price_cents: 25)
  tomato = Ingredient.create!(user: user, ingredient_type: :topping, name: 'Tomato', price_cents: 25)
  onion = Ingredient.create!(user: user, ingredient_type: :topping, name: 'Onion', price_cents: 25)
  pickle = Ingredient.create!(user: user, ingredient_type: :topping, name: 'Pickle', price_cents: 25)

  puts 'Creating sauces...'
  mayo = Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Mayo', price_cents: 0)
  mustard = Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Mustard', price_cents: 0)
  honey_mustard = Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Honey Mustard', price_cents: 0)
  ketchup = Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Ketchup', price_cents: 0)
  tabasco = Ingredient.create!(user: user, ingredient_type: :sauce, name: 'Tabasco', price_cents: 0)

  puts 'Creating price sheets...'
  price_sheet = PriceSheet.create!(user: user, name: 'Q1 2023', active: true)

  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: white_bun, price_cents: white_bun.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: wheat_bun, price_cents: wheat_bun.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: texas_toast, price_cents: texas_toast.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: lettuce_bun, price_cents: lettuce_bun.price_cents)

  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: beef, price_cents: beef.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: brisket, price_cents: brisket.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: wagyu, price_cents: wagyu.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: beyond_meat, price_cents: beyond_meat.price_cents)

  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: american, price_cents: american.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: cheddar, price_cents: cheddar.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: swiss, price_cents: swiss.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: provolone, price_cents: provolone.price_cents)

  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: lettuce, price_cents: lettuce.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: tomato, price_cents: tomato.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: onion, price_cents: onion.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: pickle, price_cents: pickle.price_cents)

  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: mayo, price_cents: mayo.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: mustard, price_cents: mustard.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: honey_mustard, price_cents: honey_mustard.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: ketchup, price_cents: ketchup.price_cents)
  PriceSheetIngredient.create!(price_sheet: price_sheet, ingredient: tabasco, price_cents: tabasco.price_cents)
end
