class AddCategoryAndPhoneNumberToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :category, :string
    add_column :restaurants, :phone_number, :string
  end
end
