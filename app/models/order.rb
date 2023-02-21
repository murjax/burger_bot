class Order < ActiveRecord::Base
  has_many :order_ingredients

  monetize :total_cents, allow_nil: true
end
