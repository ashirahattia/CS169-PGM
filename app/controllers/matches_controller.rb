class MatchesController < ApplicationController
    include ApplicationHelper
    
    before_filter :check_logged_in, :except => :index
    
    def matches_params
        params.require(:matches).permit(:group_name, :project_name)
    end
    
    def new
        Match.algorithm
        redirect_to '/matches'
    end
    
    def index
        @matches = Match.all.sort_by { |some_match| (some_match.group.group_name.to_i) }
    end
    
end
