class Order < ActiveRecord::Base
  has_many :order_burger_components

  monetize :total_cents, allow_nil: true
end
