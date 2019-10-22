class UserControler < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/tasks'
        else
            erb :'users/signup'
        end
    end

    get '/login' do 
        if logged_in?
            redirect '/tasks'
        else
            erb :'users/login'
        end
    end

    get '/logout' do 
        if session[:user_id] != nil
            logout!
        else
            redirect '/'
        end
    end
    

end
