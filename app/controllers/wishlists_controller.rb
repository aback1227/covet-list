class WishlistsController < ApplicationController
  get '/wishlists/new' do
    erb :'/wishlist/create_wishlist'
  end

  get '/wishlists' do
    erb :'/wishlist/wishlists'
  end

  post '/wishlists' do
    if logged_in?
      wishlist = Wishlist.create(title: params[:title], description: params[:description], user_id: session[:user_id])
      wishlist.user = current_user
      if wishlist.save
        redirect '/wishlists'
      else
        redirect '/wishlists/new'
      end
    else
      redirect '/login'
    end
  end

  get '/wishlists/:id' do
  end

end