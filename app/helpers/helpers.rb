class Helpers
  def self.logged_in?(session)
    !!session[:user_id]
  end
end
