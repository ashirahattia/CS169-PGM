require 'munkres'

class Match < ActiveRecord::Base
    belongs_to :group
    belongs_to :project
    
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
        @all_groups.each do |group|
            project_list = self.generate_preference_list(group)
            row = Array.new
            @all_projects.each do |project|
                if project_list.include?(project.id)
                    rank = project_list.index(project.id) + 1
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
        return Array.new(length, 999999999999)
    end

    
    # Converts results matrix to matches and filters out dummy groups created
    def self.convert_matrix_to_matches(results_matrix)
        results_matrix.each do |group_index, project_index|
            if group_index < @all_groups.length
                Match.create(:group_id => @all_groups[group_index].id, :project_id => @all_projects[project_index].id)
            end
        end
    end
    
    def self.powerize_matrix(matrix, x)
        matrix.each do |row|
            row.length.times.each do |i|
                row[i] **= x
            end
        end
    end
    
    def self.exponentiate_matrix(matrix, x)
        matrix.each do |row|
            row.length.times.each do |i|
                row[i] = x**row[i]
            end
        end
    end
    
    def self.algorithm(function_type, x)
        @all_groups = Group.all
        @all_projects = Project.all
        if (@all_groups.length == 0) or (@all_projects.length == 0) # if it's 0, the page will crash.
            return
        end
        Match.delete_all
        
        cost_matrix = self.generate_cost_matrix
        
        if function_type == :power
            self.powerize_matrix(cost_matrix, x)
        elsif function_type == :exponential
            self.exponentiate_matrix(cost_matrix, x)
        end
            
        cost_matrix = self.fill_dummy_groups(cost_matrix)
        m = Munkres.new(cost_matrix)
        self.convert_matrix_to_matches(m.find_pairings)
    end

end
