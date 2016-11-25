module MatchesHelper
    def choice_num some_match
        project_id = Project.find_by(project_name: some_match.project.project_name).id
        group = Group.where(group_name: some_match.group.group_name).to_a[0]
        case project_id
        when group[:first_choice]
            1
        when group[:second_choice]
            2
        when group[:third_choice]
            3
        when group[:fourth_choice]
            4
        when group[:fifth_choice]
            5
        when group[:sixth_choice]
            6
        when group[:seventh_choice]
            7
        else
            8 # Not on preference list
        end
    end
     
    # Determine which background color class to add to the rank column of the match table  
    def rank_color(match)
        rank = choice_num(match)
        if (rank <= 3)
            "bg-green"
        elsif (rank <=6)
            "bg-yellow"
        else
            "bg-red"
        end
    end
    
    def sum_of_match_prefs
        if Match.all.length == 0
            return 0
        end
        result = 0
        Match.all.each do |m|
            result += choice_num(m)
        end
        return result
    end
end
