module MatchesHelper
    def choice_num some_match
        project_id = Project.find_by(project_name: some_match.project_name).id
        group = Group.where(group_name: some_match.group_name).to_a[0]
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
            "Not a top choice"
        end
    end

end
