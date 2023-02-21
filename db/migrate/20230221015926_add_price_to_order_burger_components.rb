class AddPriceToOrderBurgerComponents < ActiveRecord::Migration[7.0]
  def change
    add_column :order_burger_components, :price_cents, :integer
  end
end
