class WishItem < ActiveRecord::Base
  validates :title, :quantity, :image, presence: true

  belongs_to :wishlist
end
