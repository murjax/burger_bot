class OrderBurgerComponent < ActiveRecord::Base
  belongs_to :order
  belongs_to :burger_component
  monetize :price_cents, allow_nil: true
end
