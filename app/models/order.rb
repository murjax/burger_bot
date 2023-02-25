class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_ingredients

  monetize :total_cents, allow_nil: true
end
