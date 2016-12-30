class User < ActiveRecord::Base
  validates :email, :username, uniqueness: true
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  validates :password, :username, :email, :firstname, :lastname, :birthday, presence: true
  validates :password, length: {minimum: 6}

  has_many :wishlists
  has_secure_password
  
  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|user| user.slug == slug}
  end
end

