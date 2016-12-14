class UsersController < ApplicationController

  get "/signup" do
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect "/#{@user.slug}"
      # redirect "/show"
    else
      erb :"/user/create_user"
    end
  end

  post "/signup" do
    @user = User.new(username: params[:username], email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password: params[:password], birthday: params[:birthday])
    if @user.save
      session[:user_id] = @user.id
      @user = User.find(session[:user_id])
      redirect "/#{@user.slug}"
      # redirect "/show"
    else 
      redirect "/signup"
    end
  end

  get "/login" do
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect "/#{@user.slug}"
    else 
      erb :"/user/login"
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      # redirect "/#{user.slug}"
      redirect "/show"
    else
      redirect "/login"
    end
  end

  get "/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/user/show_user"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end