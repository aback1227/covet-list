class WishlistsController < ApplicationController
  get '/wishlists/new' do
    erb :'/wishlist/create_wishlist'
  end

  get '/wishlists' do
  end

  get '/wishlists/:id' do
  end

end