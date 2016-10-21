module GroupsHelper
    
    def choice_str symbol
        if @group[symbol].nil?
            "not chosen"
        else
            proj_id = @group[symbol]
            project = Project.find(proj_id)
            project[:project_name]
        end
    end
    
end
