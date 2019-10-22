class UserControler < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/family_members'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            redirect '/family_members'
        end
    end

    get '/login' do 
        if logged_in?
            redirect '/family_members'
        else
            erb :'users/login'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/family_members'
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        if session[:user_id] != nil
            logout!
        else
            redirect '/'
        end
    end

    get '/family_members' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_members = FamilyMember.all 
        erb :'users/show'
    end

end
