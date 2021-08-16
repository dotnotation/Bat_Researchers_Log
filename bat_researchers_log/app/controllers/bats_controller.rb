class BatsController < ApplicationController

    get '/bats' do
        @bats = Bat.all
        erb :'/bats/index'
    end

    get '/bats/new' do
        redirect_if_not_logged_in
        erb :'/bats/new'
    end

    post '/bats' do
        # @bat = Bat.create(identification: params[:identification],
        #                                 nickname: params[:nickname],
        #                                 species: params[:species],
        #                                 date_found: params[:date_found],
        #                                 location: params[:location],
        #                                 date_last_seen: params[:date_last_seen],
        #                                 weight: params[:weight],
        #                                 age: params[:age],
        #                                 sex: params[:sex],
        #                                 wing_span: params[:wing_span],
        #                                 colony_size: params[:colony_size],
        #                                 conservation_status: params[:conservation_status],
        #                                 white_nose_syndrome: params[:white_nose_syndrome],
        #                                 notes: params[:notes],
        #                                 user_id: current_user.id)
        bat = current_user.bats.build(params[:bat])
        #binding.pry

        if bat.save
            flash[:message] = "Bat successfully created."
            redirect to "/bats/#{bat.id}"
        else
            flash[:error] = "#{bat.errors.full_messages.join(", ")}"
            redirect to "/bats"
        end
    end

    get '/bats/:id' do
        bat_authorization
        erb :'bats/show'
    end

    get '/bats/:slug' do
        find_bat
        erb :'/bats/show'
    end

    get '/bats/:slug/edit' do
        find_bat
        if @bat.user_id == session[:user_id]
            erb :'/bats/edit'
        else
            redirect to "/bats"
        end
    end

    patch '/bats/:slug' do
        find_bat
        if @bat.update(params[:bat])
            redirect to "/bats/#{@bat.bat_slug}"
        else
            redirect to "/bats/#{@bat.bat_slug}/edit"
        end
    end

    delete '/bats/:slug' do
        find_bat
        @bat.destroy

        redirect to "/bats"
    end

    private

    def find_bat
        @bat = Bat.find_by_bat_slug(params[:bat_slug]) 
    end
    
    def bat_authorization
        @bat = Bat.find_by_id(params[:id]) 
        if @bat.user_id != session[:user_id]
            redirect "/bats"
        end
    end
end