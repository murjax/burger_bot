class Order < ActiveRecord::Base
  monetize :total_cents, allow_nil: true
end
