class AddUserToOrdersAndIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user
    add_reference :ingredients, :user
  end
end
