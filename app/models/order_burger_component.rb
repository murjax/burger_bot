class OrderBurgerComponent < ActiveRecord::Base
  belongs_to :order
  belongs_to :burger_component
end
