class RenamePriceInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :price, :decimal
  end
end
