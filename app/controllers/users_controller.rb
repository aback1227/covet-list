class UsersController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect '/show'
    else
      erb :'/user/create_user'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password: params[:password], birthday: params[:birthday])
    if @user.save
      session[:user_id] = @user.id
      redirect '/show'
    else 
      redirect '/signup'
    end
  end

  get '/show' do
    erb :'/user/show_user'
  end

  get 'logout' do
    if session[:user_id]
      session.clear
      redirect '/login'
    else 
      redirect '/'
    end
  end

end