class WishlistsController < ApplicationController
  get '/wishlists/new' do
    @errors = session[:errors]
    erb :'/wishlist/create_wishlist'
  end

  post '/wishlists' do
    if logged_in?
      wishlist = Wishlist.new(title: params[:title], description: params[:description], user_id: session[:user_id])
      wishlist.user = current_user
      if wishlist.save
        redirect "/user/#{current_user.slug}"
      else
        session[:errors] = wishlist.errors.full_messages
        redirect '/wishlists/new'
      end
    else
      redirect '/login'
    end
  end

  get '/wishlists/:id/edit' do
    if current_user == current_wishlist.user
      @wishlist = current_wishlist
      erb :'/wishlist/edit_wishlist'
    else
      redirect "wishlists/#{current_wishlist.id}/wishitems"
    end
  end

  post '/wishlists/:id' do
    wishlist = current_wishlist
    if logged_in?
      if wishlist_updated
        redirect "/user/#{wishlist.user.slug}"
      else
        flash[:notice] = "Title can't be blank"
        redirect "/wishlists/#{current_wishlist.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  post '/wishlists/:id/delete' do
    wishlist = current_wishlist
    if current_user == current_wishlist.user
      current_wishlist.delete
      redirect "/user/#{wishlist.user.slug}"
    else
      redirect "wishlists/#{current_wishlist.id}/wishitems"
    end
  end
end