class WishItemsController < ApplicationController

  get '/wishitems/new' do
    erb :'/wishitem/create_wishitem'
  end

  get '/wishitems/:id' do
    erb :'/wishitem/show_wishitem'
  end
end