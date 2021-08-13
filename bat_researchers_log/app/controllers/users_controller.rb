class UsersController < ApplicationController
    
    get '/signup' do
        redirect_if_logged_in
        erb :'/users/new'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[user_id] = user.id 
            redirect to "/bats"
        else
            redirect to "/signup"
        end
    end

    get '/login' do
        redirect_if_logged_in
        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/bats"
        else
            redirect to "/login"
        end
    end

    get '/user/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

    get '/user/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        if @user.id == session[:user_id]
            @user.update(params[:user])
            erb :'/users/edit'
        else
            redirect to "/user/:slug"
        end
    end

    patch '/user/:slug' do
        @user = User.find_by_slug(params[:slug])
        @user.update(params[:user])
        if @user.save
            redirect to "/user/#{@user.slug}"
        else
            redirect to "/user/#{@user.slug/edit}"
        end
    end

    delete '/logout' do
        session.delete(:user_id)
        redirect to "/login"
    end
end