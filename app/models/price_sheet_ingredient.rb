class PriceSheetIngredient < ActiveRecord::Base
  belongs_to :price_sheet
  belongs_to :ingredient
  monetize :price_cents, allow_nil: true
end
