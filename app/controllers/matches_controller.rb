class MatchesController < ApplicationController
    include ApplicationHelper
    
    before_filter :check_logged_in, :except => :index
    
    def matches_params
        params.require(:matches).permit(:loss_function, :x)
    end
    
    def new
        if params[:loss_function] == "exponential"
            loss_function = :exponential
        else
            loss_function = :power
        end
        
        x = params[:x].to_f
        x = [x, 0].max # x shouldn't be negative
        x = [x, 10].min # if x is too high, shit crashes. and results converge anyway so...
        
        Match.algorithm(loss_function, x)
        redirect_to '/matches'
    end
    
    def index
        @matches = Match.all.sort_by { |some_match| (some_match.group.group_name.to_i) }
    end
    
end
