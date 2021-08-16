class UsersController < ApplicationController
    
    get '/signup' do
        redirect_if_logged_in
        erb :'/users/new'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id 
            redirect to "/bats"
        else
            redirect to "/signup"
        end
    end

    get '/user/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

    get '/user/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        redirect_if_not_authorized(@user)
            erb :'/users/edit'
    end

    patch '/user/:slug' do
        user = User.find_by_slug(params[:slug])
        user.username = params[:username]
        user.email = params[:email]
        user.organization = params[:organization]
        user.password = params[:password]
        if user.save
            redirect to "/user/#{user.slug}"
        else
            redirect to "/user/#{user.slug}/edit"
        end
    end

    get '/user/:slug/delete' do
        redirect_if_not_authorized(User.find_by_slug(params[:slug]))
        @user = User.find_by_slug(params:slug)
        erb :'users/delete'
    end

    delete '/user/:slug' do
        redirect_if_not_authorized(User.find_by_slug(params[:slug]))
        user = User.find_by_slug(params[:slug])
        user.destroy
        session.delete(:user_id)
        redirect to "/"
    end

end