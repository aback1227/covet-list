class WishlistsController < ApplicationController
  get '/wishlists/new' do
    erb :'/wishlist/create_wishlist'
  end

  post '/wishlists' do
    if logged_in?
      wishlist = Wishlist.new(title: params[:title], description: params[:description], user_id: session[:user_id])
      wishlist.user = current_user
      if wishlist.save
        redirect "/user/#{current_user.slug}"
      else
        redirect '/wishlists/new'
      end
    else
      redirect '/login'
    end
  end

  get '/wishlists/:id/edit' do
    if logged_in?
      @wishlist = current_wishlist
      erb :'/wishlist/edit_wishlist'
    else
      redirect '/login'
    end
  end

  post '/wishlists/:id' do
    wishlist = current_wishlist
    if logged_in?
      if wishlist_updated
        redirect "/user/#{wishlist.user.slug}"
      else
        redirect "/wishlists/#{current_wishlist.id}/edit"
      end
    else
      redirect '/login'
    end
  end
end