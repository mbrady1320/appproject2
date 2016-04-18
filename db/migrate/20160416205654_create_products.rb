class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :text
      t.string :image_url

      t.timestamps null: false
    end
  end
end
