class BatsController < ApplicationController

    get '/bats' do
        erb :'/bats/index'
    end

    get '/bats/new' do
        erb :'/bats/new'
    end

    post '/bats' do
    end

    get '/bats/:id' do
        erb :'/bats/show'
    end

    get '/bats/:id/edit' do
        erb :'/bats/edit'
    end

    patch '/bats/:id' do
    end

    delete '/bats/:id' do
    end
end