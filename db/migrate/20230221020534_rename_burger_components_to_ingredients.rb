class RenameBurgerComponentsToIngredients < ActiveRecord::Migration[7.0]
  def change
    rename_table :burger_components, :ingredients
    rename_table :order_burger_components, :order_ingredients
    remove_reference :order_ingredients, :burger_component
    add_reference :order_ingredients, :ingredient
  end
end
