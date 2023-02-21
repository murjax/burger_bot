class RenameComponentTypeToIngredientType < ActiveRecord::Migration[7.0]
  def change
    rename_column :ingredients, :component_type, :ingredient_type
  end
end
