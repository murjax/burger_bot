class Ingredient < ActiveRecord::Base
  enum :ingredient_type, [:bread, :patty, :cheese, :topping, :sauce]
  monetize :price_cents, allow_nil: true
end
