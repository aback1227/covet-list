class ApplicationController < Sinatra::Base

  configure do
      set :views, "app/views"
      set :public_dir, "public"
      enable :sessions
      set :session_secret, "cookie"
  end

  get '/' do
    erb :index
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