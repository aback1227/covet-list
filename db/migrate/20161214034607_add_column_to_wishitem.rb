class AddColumnToWishItem < ActiveRecord::Migration[5.0]
  def change
    add_column :wishitems, :wishlist_id, :integer
  end
end
