class CreatePriceSheetIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :price_sheet_ingredients do |t|
      t.references :price_sheet
      t.references :ingredient
      t.integer :price_cents

      t.timestamps
    end
  end
end
