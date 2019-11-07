require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "estateplan"
    end

    get '/' do 
        erb :'/index'
    end

    # helpers for login, logout, current user, and redirect if not logged in
    helpers do 

        def redirect_if_not_logged_in
            if !logged_in?
              redirect "/login?error=You have to be logged in to do that"
            end
        end
        
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

        def logout!
            session.clear
        end

    end


end
