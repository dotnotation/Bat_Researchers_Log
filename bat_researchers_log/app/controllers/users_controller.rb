class UsersController < ApplicationController
    
    get '/signup' do
        redirect_if_logged_in
        erb :'/users/new'
    end

    post '/signup' do
        user = User.new(params[:user])
        #binding.pry
        if user.save
            session[:user_id] = user.id 
            redirect to "/bats"
        else
            flash[:error] = "#{user.errors.full_messages.join(", ")}"
            redirect to "/signup"
        end
    end

    get '/user/:slug' do
        @user = User.find_by_slug(params[:slug])
        if @user
            erb :'/users/show'
        else
            flash[:error] = "We are unable to find that user. Please try again."
            redirect to "/bats"
        end
    end

    get '/user/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        redirect_if_not_authorized(@user)
            erb :'/users/edit'
    end

    patch '/user/:slug' do
        user = User.find_by_slug(params[:slug])
        # user.username = params[:username]
        # user.email = params[:email]
        # user.organization = params[:organization]
        # user.password = params[:password]
        
        user.update(params[:user])
        #binding.pry
        if user.save
            flash[:message] = "Your account has been updated."
            redirect to "/user/#{user.slug}"
        else
            flash[:error] = "#{user.errors.full_messages.join(", ")}"
            redirect to "/user/#{user.slug}/edit"
        end
    end

    get '/user/:slug/delete' do
        redirect_if_not_authorized(User.find_by_slug(params[:slug]))
        @user = User.find_by_slug(params:slug)
        erb :'users/delete'
    end

    delete '/user/:slug/delete' do
        redirect_if_not_authorized(User.find_by_slug(params[:slug]))
        user = User.find_by_slug(params[:slug])
        user.destroy
        session.delete(:user_id)
        flash[:message] = "Your account has been deleted. We are sorry to see you go."
        redirect to "/"
    end

end