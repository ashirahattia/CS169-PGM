require 'munkres'

class Match < ActiveRecord::Base
    
    $all_projects = Project.all
    $all_groups = Group.all
    
    def self.generate_preference_list(group)
        group_preferences = [group[:first_choice], group[:second_choice],
                            group[:third_choice], group[:fourth_choice],
                            group[:fifth_choice], group[:sixth_choice],
                            group[:seventh_choice]]
        return group_preferences
    end
    
    
    # Creates a cost matrix in which each row corresponds to a group and each
    # column corresponds to a project. Each cell represents a group's ranking
    # for that project, where if a project is not ranked by the group, then
    # it is given a cost of 100.
    def self.generate_cost_matrix
        cost_matrix = Array.new
        $all_groups.each do |group|
            project_list = self.generate_preference_list(group)
            row = Array.new
            $all_projects.count.times do |index|
                curr_project = $all_projects[index]
                if project_list.include?(curr_project.id)
                    rank = project_list.index(curr_project.id) + 1
                    row << rank
                else 
                    row << 100
                end 
            end
            cost_matrix << row
        end
        return cost_matrix
    end
   
    
    # Fill in cost matrix with dummy groups to create an nxn cost matrix
    # since there will probably be more projects than groups
    def self.fill_dummy_groups(cost_matrix)
        num_projects = cost_matrix[0].length
        while num_projects > cost_matrix.length
            dummy_row = self.make_dummy_arr(num_projects)
            cost_matrix << dummy_row
        end 
        return cost_matrix
    end
    
    
    # Helper method for fill_in_dummy_groups
    def self.make_dummy_arr(length)
        return Array.new(length, 500)
    end

    
    # Converts results matrix to matches and filters out dummy groups created
    def self.convert_matrix_to_matches(results_matrix)
        results_matrix.each do |group_id, project_id|
            if group_id < $all_groups.length
                group_name = $all_groups[group_id].group_name
                project_name = $all_projects[project_id].project_name
                Match.create(:group_name => group_name, :project_name => project_name)
            end
        end
    end
    
    
    def self.algorithm
        Match.delete_all
        cost_matrix = self.fill_dummy_groups(self.generate_cost_matrix)
        m = Munkres.new(cost_matrix)
        self.convert_matrix_to_matches(m.find_pairings)
    end

end
