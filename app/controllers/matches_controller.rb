class MatchesController < ApplicationController
    include ApplicationHelper
    
    before_filter :check_logged_in, :except => :index
    
    def new
        if params[:loss_function] == "exponential"
            loss_function = :exponential
            session[:exponential] = "checked=checked"
            session[:power] = ""
        else
            loss_function = :power
            session[:power] = "checked=checked"
            session[:exponential] = ""
        end
        
        x = params[:x].to_f
        x = [x, 1.0e-14].max # x shouldn't be negative
        x = [x, 10].min # if x is too high, shit crashes. and results converge anyway so...
        session[:x] = x.to_s
        
        Match.algorithm(loss_function, x)
        redirect_to '/matches'
    end
    
    def index
        @matches = Match.all.sort_by { |some_match| (some_match.group.id.to_i) }
    end
    
end
