require './config/environment'

class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "estateplan"
    end

    get '/' do 
        erb :index
    end

    # helpers for login, logout, and current user
    helpers do 
        
        def loggin_in?
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
