class AddOpenAndCloseToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :open, :integer
    add_column :restaurants, :close, :integer
  end
end
