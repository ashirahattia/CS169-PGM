require 'munkres'

class Match < ActiveRecord::Base
    
    $all_projects = Project.all
    $all_groups = Group.all
    
    
    def generate_preference_list(group)
        group_preferences = [group.first_choice, group.second_choice,
                            group.third_choice, group.fourth_choice,
                            group.fifth_choice, group.sixth_choice,
                            group.seventh_choice]
        return group_preferences
    end
    
    
    # Creates a cost matrix in which each row corresponds to a group and each
    # column corresponds to a project. Each cell represents a group's ranking
    # for that project, where if a project is not ranked by the group, then
    # it is given a cost of 100.
    def generate_cost_matrix
        cost_matrix = Array.new
        all_groups.each do |group|
            project_list = generate_preference_list(group)
            row = Array.new
            all_projects.count.times do |index|
                curr_project = all_projects[index]
                if project_list.include?(curr_project)
                    rank = project_list.index(curr_project) + 1
                    row << rank
                else 
                    row << 100
                end 
            end
            cost_matrix << row
        return cost_matrix
    
    
    def self.algorithm
        cost_matrix = generate_cost_matrix
        m = Munkres.new(cost_matrix)
        puts m.find_pairings
        # m.find_pairings.each do |group, project|
        #     create_match(group, project)
        # end
    end
    
    
    def create_match(group_name, project_name)
        Match.create(:group_name => group_name, :project_name => project_name)
    end 
    
    # def self.algorithm
    #     Match.delete_all
    #     all_projects = Project.all.shuffle
    #     all_groups = Group.all
    #     all_groups.count.times do |index|
    #         group_name = all_groups[index].group_name
    #         project_name = all_projects[index].project_name
    #         Match.create(:group_name => group_name, :project_name => project_name)
    #     end
    # end
end
