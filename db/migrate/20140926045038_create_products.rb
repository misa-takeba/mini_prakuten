class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :postage
      t.string :imageUrl
      t.integer :salesMinPrice
      t.integer :usedExcludeMinPrice
      t.integer :usedExcludeSalesMinPrice
      t.integer :minPrice

      t.timestamps
    end
  end
end
