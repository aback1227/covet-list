class WishItemsController < ApplicationController

  get '/wishitems/new' do
  end

  get '/wishitems/:id' do
    erb :'/wishitem/show_wishitem'
  end
end