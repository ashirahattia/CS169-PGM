require "spec_helper"

describe MatchesHelper, :type => :helper do

    it 'returns the project preference number' do
        fake_projects = []
        for project_index in 1..8
            fake_proj_name = ("Project" + project_index)
            fake_proj = Project.new(:project_name => fake_proj_name, :id => project_index)
            allow(Project).to receive(:find_by).with(:project_name => fake_proj_name) { fake_proj }
            fake_projects.push(fake_proj)
        end

        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)

        allow(Group).to receive(:where).with(:group_name => "Group1") { [fake_group1] }

        fake_matches = []
        for match_index in 1..8
            fake_match_proj = ("Project" + match_index)
            fake_match = Match.new(:project_name => fake_match_proj, :group_name => "Group1")
            fake_matches.push(fake_match)
        end

        for match in 1..8
            helper.choice_num(fake_matches[match-1]).should eql(match)
        end

    end

    it 'finds the right background color for the rank' do
        fake_project1 = Project.new(:project_name => "Project1", :id => 1)
        fake_project2 = Project.new(:project_name => "Project2", :id => 2)
        fake_project3 = Project.new(:project_name => "Project3", :id => 3)
        fake_project4 = Project.new(:project_name => "Project4", :id => 4)
        fake_project5 = Project.new(:project_name => "Project5", :id => 5)
        fake_project6 = Project.new(:project_name => "Project6", :id => 6)
        fake_project7 = Project.new(:project_name => "Project7", :id => 7)
        
        allow(Project).to receive(:find_by).with(:project_name => "Project1") { fake_project1 }
        allow(Project).to receive(:find_by).with(:project_name => "Project2") { fake_project2 }
        allow(Project).to receive(:find_by).with(:project_name => "Project3") { fake_project3 }
        allow(Project).to receive(:find_by).with(:project_name => "Project4") { fake_project4 }
        allow(Project).to receive(:find_by).with(:project_name => "Project5") { fake_project5 }
        allow(Project).to receive(:find_by).with(:project_name => "Project6") { fake_project6 }
        allow(Project).to receive(:find_by).with(:project_name => "Project7") { fake_project7 }
        
        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)
        
        allow(Group).to receive(:where).with(:group_name => "Group1") { [fake_group1] }
        
        fake_match1 = Match.new(:project_name => "Project1", :group_name => "Group1")
        fake_match2 = Match.new(:project_name => "Project5", :group_name => "Group1")
        fake_match3 = Match.new(:project_name => "Project7", :group_name => "Group1")
        
        helper.should_receive(:choice_num).with(fake_match1).and_return(1)
        helper.should_receive(:choice_num).with(fake_match2).and_return(5)
        helper.should_receive(:choice_num).with(fake_match3).and_return(7)
        
        helper.rank_color(fake_match1).should eql("bg-green")
        helper.rank_color(fake_match2).should eql("bg-yellow")
        helper.rank_color(fake_match3).should eql("bg-red")
        
    end
end