class RemoveOpenAndCloseFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :open, :integer
    remove_column :restaurants, :close, :integer
  end
end
