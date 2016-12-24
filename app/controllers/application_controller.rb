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

    def current_wishlist
      Wishlist.find_by_id(params[:id])
    end

    def wishlist_updated
      current_wishlist.update(title: params[:title], description: params[:description])
    end
  end
end