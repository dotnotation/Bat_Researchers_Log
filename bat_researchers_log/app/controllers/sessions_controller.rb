class SessionsController < ApplicationController

    get '/login' do
        redirect_if_logged_in
        erb :'/sessions/login'
    end

    post '/login' do
        redirect_if_logged_in
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id 
          redirect to "/bats"
        else
          flash[:error] = "Invalid login. Please try again."
          redirect to "/login"
        end
    end

    delete '/logout' do
      redirect_if_not_logged_in
        session.delete(:user_id)
        flash[:message] = "You have been logged out of your account. We hope to see you again soon."
        redirect to "/login"
    end
end
