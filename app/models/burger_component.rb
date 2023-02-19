class BurgerComponent < ActiveRecord::Base
  enum :component_type, [:bread, :patty, :cheese, :topping, :sauce]
  monetize :price_cents, allow_nil: true
end
