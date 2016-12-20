class AddColumnToWishItem < ActiveRecord::Migration[5.0]
  def change
    add_column :wish_items, :wishlist_id, :integer
  end
end
