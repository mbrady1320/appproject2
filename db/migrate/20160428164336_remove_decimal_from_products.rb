class RemoveDecimalFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :decimal, :string
  end
end
