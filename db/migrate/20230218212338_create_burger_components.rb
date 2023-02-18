class CreateBurgerComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :burger_components do |t|
      t.integer :component_type
      t.integer :price_cents
      t.string :name

      t.timestamps
    end
  end
end
