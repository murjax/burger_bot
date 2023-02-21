class Ingredient < ActiveRecord::Base
  belongs_to :user

  enum :ingredient_type, [:bread, :patty, :cheese, :topping, :sauce]
  monetize :price_cents, allow_nil: true

  def price_sheet_ingredient
    PriceSheet
      .find_by(active: true)
      .price_sheet_ingredients
      .find_by(ingredient_id: id)
  end
end
