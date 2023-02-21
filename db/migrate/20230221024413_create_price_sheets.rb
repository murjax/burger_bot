class CreatePriceSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :price_sheets do |t|
      t.string :name
      t.boolean :active, default: false
      t.references :user

      t.timestamps
    end
  end
end
