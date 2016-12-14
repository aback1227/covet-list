class User < ActiveRecord::Base
  has_many :wishlists
  has_secure_password
  
  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
  end
end