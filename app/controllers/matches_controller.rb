class MatchesController < ApplicationController
    
    def matches_params
        params.require(:matches).permit(:group_name, :project_name)
    end
    
    def index
    end
    
    def new
    end
    
    def generate_and_show_results
        Match.algorithm
        redirect match_path
    end
    
    def show
        @matches = Match.all
    end
    
end
