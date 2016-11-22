module GroupsHelper
    
    # Makes the current preference visible
    def choice_str symbol
        if @group[symbol].nil?
            "not chosen"
        else
            proj_id = @group[symbol]
            project = Project.find(proj_id)
            project[:project_name]
        end
    end
    
    def destroy_corresponding_match group_id
        group_name = Group.find(group_id).group_name
        Match.all.each do |match|
            if match.group_name == group_name
                Match.delete match.id
                return
            end
        end
    end 
    
end
