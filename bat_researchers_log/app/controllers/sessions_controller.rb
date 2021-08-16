class SessionsController < ApplicationController

    get '/login' do
        redirect_if_logged_in
        erb :'/users/login'
    end

    post '/login' do
        redirect_if_logged_in
        user = User.find_by(:username => params[:username])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id 
          redirect to "/bats"
        else
          redirect to "/login"
        end
    end

    delete '/logout' do
        session.delete(:user_id)
        redirect to "/login"
    end
end
