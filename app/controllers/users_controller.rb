class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/family_members'
        else
            erb :'/users/signup'
        end
    end

    post '/signup' do
        user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username], :password => params[:password])
        if user.save 
            session[:user_id] = user.id 
            redirect '/family_members'
        else 
            flash[:signup_errors] = user.errors.full_messages.to_sentence
            redirect '/signup'
        end 
        
        # # original code
        # if params[:username] == "" || params[:password_digest] == ""
        #     flash[:error_blank] = "Your username or password cannot be blank!"
        #     redirect '/signup'
        #     # add validation here
        #     # if user is not unique redirect to signup
        #     # else continue below
        #     flash[:username_already_exists] = "That username already exists."
        # else
        #     @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :username => params[:username], :password => params[:password])
        #     @user.save
        #     session[:user_id] = @user.id
        #     redirect '/family_members'
        # end
    end

    get '/login' do 
        if logged_in?
            redirect '/family_members'
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if !@user
            flash[:user_not_found] = "Username not found or is incorrect!"
            redirect '/login'
        elsif @user && !@user.authenticate(params[:password])
            flash[:password_incorrect] = "Password is incorrect!"
            redirect '/login'
        else @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/family_members'
        end
    end

    get '/logout' do 
        if session[:user_id] != nil
            logout!
            redirect '/'
        else
            redirect '/'
        end
    end

    get '/family_members' do 
        redirect_if_not_logged_in
        @user = current_user
        @family_members = @user.family_members
        erb :'/users/show'
    end

end
