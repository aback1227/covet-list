require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

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
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_wishlist
      Wishlist.find_by_id(params[:id])
    end

    def wishlist_updated
      current_wishlist.update(title: params[:title], description: params[:description])
    end
  end
end