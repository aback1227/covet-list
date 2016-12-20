class CreateWishItems < ActiveRecord::Migration[5.0]
  def change
    create_table :wish_items do |t|
      t.string :title
      t.string :url
      t.string :note
      t.string :image
      t.integer :quantity
      t.string :price
    end
  end
end
