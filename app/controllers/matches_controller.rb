class MatchesController < ApplicationController
    
    def matches_params
        params.require(:matches).permit(:group_name, :project_name)
    end
    
    def index
    end
    
    def new
    end
    
    def show
        Match.algorithm
        @matches = Match.all
    end
    
end
