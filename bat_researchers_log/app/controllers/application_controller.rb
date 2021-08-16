require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    use Rack::Flash, :sweep => true
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect "/login" if !logged_in?
    end

    def redirect_if_logged_in 
      redirect "/bats" if logged_in?
    end

    def redirect_if_not_authorized(user)
      if user.id != current_user.id
        redirect "/bats"
      end
    end
  end

end
