class LoginController < ApplicationController
    
    def index
        if session[:is_ta]
            flash[:notice] = "You're currently logged in."
        end
    end
    
    def logout
        session[:is_ta] = false
        redirect_to :login
    end
    
    def attempt
        username = params[:username]
        password = params[:password]
        if username == 'TA' and password == 'TA'
            session[:is_ta] = true
            redirect_to '/matches/show'
            return
        end
        flash[:notice] = "Login attempt failed."
        redirect_to :login
    end
    
end
