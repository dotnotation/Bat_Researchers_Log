class UsersController < ApplicationController
    
    get '/signup' do
        erb :'/users/new'
    end

    post '/signup' do
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
    end

    get '/user/:slug' do
        erb :'/users/show'
    end

    get '/user/:slug/edit' do
        erb :'/users/edit'
    end

    patch '/user/:slug' do
    end

    delete '/logout' do
    end
end