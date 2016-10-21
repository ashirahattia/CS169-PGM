# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

groups = [  {:group_name => 'group1'},
            {:group_name => 'group2'},
            {:group_name => 'group3'},
            {:group_name => 'group4'}]
            
groups.each do |group|
    Group.create!(group)
end
            
projects = [ {:project_name => 'proj1'},
             {:project_name => 'proj2'},
             {:project_name => 'proj3'},
             {:project_name => 'proj4'}]
             
projects.each do |project|
    Project.create!(project)
end