class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wish_items
end