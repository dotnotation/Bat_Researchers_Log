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
        bat = current_user.bats.build(params[:bat])

        if bat.save
            flash[:message] = "Bat successfully created."
            redirect to "/bats/#{bat.identification}"
        else
            flash[:error] = "#{bat.errors.full_messages.join(", ")}"
            redirect to "/bats"
        end
    end

    get '/bats/:identification' do
        @bat = Bat.find_by(identification: params[:identification]) 
        if @bat
            erb :'bats/show'
        else
            flash[:error] = "There is no bat with that identification in the database."
            redirect to "/bats"
        end
    end

    get '/bats/:identification/edit' do
        bat_authorization
        if @bat.user_id == session[:user_id]
            erb :'/bats/edit'
        else
            redirect to "/bats"
        end
    end

    patch '/bats/:identification' do
        bat_authorization
        if @bat.update(params[:bat])
            flash[:message] = "Your bat has been updated."
            redirect to "/bats/#{@bat.identification}"
        else
            flash[:error] = "#{@bat.errors.full_messages.join(", ")}"
            redirect to "/bats/#{@bat.identification}/edit"
        end
    end

    delete '/bats/:identification/delete' do
        bat_authorization
        @bat.destroy
        flash[:message] = "Your bat has been deleted from the database."
        redirect to "/bats"
    end

    private
   
    def bat_authorization
        @bat = Bat.find_by(identification: params[:identification]) 
        if @bat.user_id != session[:user_id]
            flash[:error] = "You are not authorized to make changes to this bat."
            redirect "/bats"
        end
    end
end