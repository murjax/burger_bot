class Ingredient < ActiveRecord::Base
  belongs_to :user
  after_commit :process_photo_variants

  enum :ingredient_type, [:bread, :patty, :cheese, :topping, :sauce]
  monetize :price_cents, allow_nil: true

  has_one_attached :photo do |attachable|
    attachable.variant :thumb_small, resize_to_limit: [50, 50]
    attachable.variant :thumb_large, resize_to_limit: [100, 100]
  end

  def process_photo_variants
    return unless photo.attached?

    photo.variant(:thumb_small).processed
    photo.variant(:thumb_large).processed
  end
end
