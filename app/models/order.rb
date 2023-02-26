class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_ingredients, dependent: :destroy

  monetize :total_cents, allow_nil: true
end
