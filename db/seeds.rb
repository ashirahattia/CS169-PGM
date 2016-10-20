# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

groups = [  {:group_name => 'a'},
            {:group_name => 'b'},
            {:group_name => 'c'},
            {:group_name => 'd'}]
            
groups.each do |group|
    Group.create!(group)
end
            
projects = [ {:project_name => '1'},
             {:project_name => '2'},
             {:project_name => '3'},
             {:project_name => '4'}]
             
projects.each do |project|
    Project.create!(project)
end