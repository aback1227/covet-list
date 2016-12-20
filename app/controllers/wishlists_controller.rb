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

  get '/wishlists/:id' do
    @wishlist = Wishlist.find_by_id(params[:id])
    erb :'/wishlist/show_wishlist'
  end

  post '/wishlists/:id' do
    if logged_in?
      wishitem = WishItem.new(title: params[:title], url: params[:url], price: params[:price], quantity: params[:quantity], image: params[:image], note: params[:note])
      wishitem.wishlist = Wishlist.find_by_id(params[:id])
      if wishitem.save
        redirect "/wishlists/<%= wishitem.wishlist.id%>"
      else 
        redirect '/wishlists'
      end
    else
      redirect '/login'
    end
  end
end