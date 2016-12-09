class UsersController < ApplicationController

  get '/signup' do
    erb :'/user/create_user'
  end

end