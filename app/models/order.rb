class Order < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :order_ingredients, dependent: :destroy

  monetize :total_cents, allow_nil: true

  mapping do
    indexes :name, type: :text
    indexes :total, type: :text
    indexes :order_ingredients do
      indexes :name, type: :text
    end
  end

  def as_indexed_json(_options = {})
    as_json(
      include: { order_ingredients: { methods: [:name], only: [:name] } }
    ).merge(total: total.to_s).stringify_keys
  end
end
