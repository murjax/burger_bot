class OrderIngredient < ActiveRecord::Base
  belongs_to :order
  belongs_to :ingredient
  monetize :price_cents, allow_nil: true

  delegate :name, to: :ingredient
end
