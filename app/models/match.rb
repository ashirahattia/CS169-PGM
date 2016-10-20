class Match < ActiveRecord::Base
    def self.algorithm
        Match.delete_all
        all_projects = Project.all.shuffle
        all_groups = Group.all
        all_groups.count.times do |index|
            group_name = all_groups[index].group_name
            project_name = all_projects[index].project_name
            Match.create(:group_name => group_name, :project_name => project_name)
        end
    end
end
