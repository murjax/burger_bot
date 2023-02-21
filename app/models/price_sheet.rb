class PriceSheet < ActiveRecord::Base
  belongs_to :user
  has_many :price_sheet_ingredients
end
