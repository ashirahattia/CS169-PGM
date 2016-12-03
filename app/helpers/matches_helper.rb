module MatchesHelper
    def choice_num some_match
        project_id = some_match.project.id
        group = some_match.group
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
    
    def num_with_preference(x)
        count = 0
        Match.all.each do |m|
            if choice_num(m) == x
                count += 1
            end
        end
        return count
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
    
    def find_unmatched_projects
        projects = Project.all
        matched = Match.pluck(:project_id)
        unmatched = []
        projects.each do |project|
            if (not matched.include? project.id)
                unmatched.append(project)
            end
        end
        return unmatched
    end

end
