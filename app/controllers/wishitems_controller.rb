class WishItemsController < ApplicationController

  get '/wishitems/new' do
    erb :'/wishitem/create_wishitem'
  end

  get '/wishitems/:id' do
    erb :'/wishitem/show_wishitem'
  end

  get '/wishitems/:id/edit' do
    if logged_in?
      @wishitem = WishItem.find_by_id(params[:id])
      erb :'/wishitem/edit_wishitem'
    else
      redirect '/login'
    end
  end

  post '/wishitems/:id' do
    if logged_in?
      if wishitem_updated
        redirect "/wishlists/#{current_wishitem.wishlist.id}"
      else 
        redirect "/wishitems/#{current_wishitem.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  post '/wishitems/:id/delete' do
    @wishlist = current_wishitem.wishlist.id
    if logged_in?
      current_wishitem.delete
      redirect "/wishlists/#{@wishlist}"
    else 
      redirect '/login'
    end
  end

  helpers do 
    def current_wishitem
      WishItem.find_by_id(params[:id])
    end

    def wishitem_updated
      current_wishitem.update(title: params[:title], url: params[:url], price: params[:price], quantity: params[:quantity], image: params[:image], note: params[:note])
    end
  end
end