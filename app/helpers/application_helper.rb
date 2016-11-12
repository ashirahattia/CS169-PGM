module ApplicationHelper
    
    def check_logged_in
        if !session[:is_ta]
            redirect_to :login
        end
    end
    
end
