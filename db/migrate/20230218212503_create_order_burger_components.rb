class CreateOrderBurgerComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :order_burger_components do |t|
      t.references :order
      t.references :burger_component

      t.timestamps
    end
  end
end
