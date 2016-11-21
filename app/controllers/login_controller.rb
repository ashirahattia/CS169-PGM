class LoginController < ApplicationController
    
    def index
        if session[:is_ta]
            flash[:notice] = "You're currently logged in."
        end
    end
    
    def logout
        session[:is_ta] = false
        flash[:notice] = nil
        redirect_to :login
    end
    
    def attempt
        password = params[:password]
        if password == 'TA'
            session[:is_ta] = true
            redirect_to '/matches'
            return
        end
        flash[:notice] = "Login attempt failed."
        redirect_to :login
    end
    
end
