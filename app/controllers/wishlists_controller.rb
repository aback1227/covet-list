class WishlistsController < ApplicationController
  get '/wishlists/new' do
    erb :'/wishlist/create_wishlist'
  end

  post '/wishlists' do
    if logged_in?
      wishlist = Wishlist.create(title: params[:title], description: params[:description], user_id: session[:user_id])
      wishlist.user = current_user
      if wishlist.save
        redirect "/users/#{current_user.slug}"
      else
        redirect '/wishlists/new'
      end
    else
      redirect '/login'
    end
  end

  get '/wishlists/:id' do
    @wishlist = Wishlist.find_by_id(params[:id])
    erb :'/wishlist/show_wishlist'
  end

end