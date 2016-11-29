# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

groups = [  {:id => 1},
            {:id => 2},
            {:id => 3},
            {:id => 4}]
            
groups.each do |group|
    Group.create!(group)
end
            
projects = [ {:project_name => 'proj1'},
             {:project_name => 'proj2'},
             {:project_name => 'proj3'},
             {:project_name => 'proj4'},
             {:project_name => 'proj5'},
             {:project_name => 'proj6'},
             {:project_name => 'proj7'},
             {:project_name => 'ying eats the babies'}]
             
projects.each do |project|
    Project.create!(project)
end

Setting.create(:spreadsheet_id => '1kPwI0T6PnmVT9TF7QqDa1TWsKlnNRG2sXGBsnhWv7AI',
               :group_tab => 'Groups!A1:Y1000',
               :group_username_col => '1',
               :group_id_col => '2',
               :group_preference_1 => '4',
               :group_preference_2 => '5',
               :group_preference_3 => '6',
               :group_preference_4 => '7',
               :group_preference_5 => '8',
               :group_preference_6 => '9',
               :group_preference_7 => '10',
               :project_tab => 'Projects',
               :project_id_col => '0',
               :project_name_col => '1',
               :matches_tab => 'Current_Match')