class Wishlist < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :wish_items
end