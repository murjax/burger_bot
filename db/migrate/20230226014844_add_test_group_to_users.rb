class AddTestGroupToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :test_group, :boolean, default: false, null: false
  end
end
