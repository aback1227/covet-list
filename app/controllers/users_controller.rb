class UsersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else
      @errors = session[:errors]
      erb :'/user/create_user'
    end
  end

  post "/signup" do
    user = User.new(username: params[:username], email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password: params[:password], birthday: params[:birthday])
    if user.save
      session[:user_id] = user.id
      redirect "/user/#{current_user.slug}"
    else 
      session[:errors] = user.errors.full_messages
      redirect "/signup"
    end
  end

  get "/login" do
    if logged_in?
      redirect "/user/#{current_user.slug}"
    else 
      erb :'/user/login'
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/user/#{current_user.slug}"
    else
      redirect "/login"
    end
  end

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/user/show_user'
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end

helpers do

end