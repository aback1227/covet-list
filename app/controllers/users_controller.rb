class UsersController < ApplicationController

  get '/signup' do
    erb :'/user/create_user'
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password: params[:password], birthday: params[:birthday])
    if @user.save
      redirect '/show'
    else 
      redirect '/signup'
    end
  end

  get '/show' do
    erb :'/user/show_user'
  end

end