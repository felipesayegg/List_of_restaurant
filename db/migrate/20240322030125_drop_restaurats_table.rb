class DropRestauratsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :restaurats
  end
end
