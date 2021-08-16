class BatsController < ApplicationController

    get '/bats' do
        @bats = Bat.all
        erb :'/bats/index'
    end

    get '/bats/new' do
        erb :'/bats/new'
    end

    post '/bats' do
        @bat = current_user.bats.build(params[:bat])
        if @bat.save
            redirect to "/bats/#{@bat.slug}"
        else
            redirect to "/bats"
        end
    end

    get '/bats/:slug' do
        @bat = Bat.find_by_bat_slug(params[:slug])
        erb :'/bats/show'
    end

    get '/bats/:slug/edit' do
        @bat = Bat.find_by_bat_slug(params[:slug])
        if @bat.user_id == session[:user_id]
            erb :'/bats/edit'
        else
            redirect to "/bats"
        end
    end

    patch '/bats/:slug' do
        @bat = Bat.find_by_bat_slug(params[:slug])
        if @bat.update(params[:bat])
            redirect to "/bats/#{@bat.slug}"
        else
            redirect to "/bats/#{@bat.slug}/edit"
        end
    end

    delete '/bats/:slug' do
        @bat = Bat.find_by_bat_slug(params[:slug])
        @bat.destroy

        redirect to "/bats"
    end
end