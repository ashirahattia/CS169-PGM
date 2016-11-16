require "spec_helper"

describe MatchesHelper, :type => :helper do
    it 'returns the project preference number' do
        fake_project1 = Project.new(:project_name => "Project1", :id => 1)
        fake_project2 = Project.new(:project_name => "Project2", :id => 2)
        fake_project3 = Project.new(:project_name => "Project3", :id => 3)
        fake_project4 = Project.new(:project_name => "Project4", :id => 4)
        fake_project5 = Project.new(:project_name => "Project5", :id => 5)
        fake_project6 = Project.new(:project_name => "Project6", :id => 6)
        fake_project7 = Project.new(:project_name => "Project7", :id => 7)
        fake_project8 = Project.new(:project_name => "Project8", :id => 8)
        
        allow(Project).to receive(:find_by).with(:project_name => "Project1") { fake_project1 }
        allow(Project).to receive(:find_by).with(:project_name => "Project2") { fake_project2 }
        allow(Project).to receive(:find_by).with(:project_name => "Project3") { fake_project3 }
        allow(Project).to receive(:find_by).with(:project_name => "Project4") { fake_project4 }
        allow(Project).to receive(:find_by).with(:project_name => "Project5") { fake_project5 }
        allow(Project).to receive(:find_by).with(:project_name => "Project6") { fake_project6 }
        allow(Project).to receive(:find_by).with(:project_name => "Project7") { fake_project7 }
        allow(Project).to receive(:find_by).with(:project_name => "Project8") { fake_project8 }
        
        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)
        
        allow(Group).to receive(:where).with(:group_name => "Group1") { [fake_group1] }
        
        fake_match1 = Match.new(:project_name => "Project1", :group_name => "Group1")
        fake_match2 = Match.new(:project_name => "Project2", :group_name => "Group1")
        fake_match3 = Match.new(:project_name => "Project3", :group_name => "Group1")
        fake_match4 = Match.new(:project_name => "Project4", :group_name => "Group1")
        fake_match5 = Match.new(:project_name => "Project5", :group_name => "Group1")
        fake_match6 = Match.new(:project_name => "Project6", :group_name => "Group1")
        fake_match7 = Match.new(:project_name => "Project7", :group_name => "Group1")
        fake_match8 = Match.new(:project_name => "Project8", :group_name => "Group1")

        helper.choice_num(fake_match1).should eql(1)
        helper.choice_num(fake_match2).should eql(2)
        helper.choice_num(fake_match3).should eql(3)
        helper.choice_num(fake_match4).should eql(4)
        helper.choice_num(fake_match5).should eql(5)
        helper.choice_num(fake_match6).should eql(6)
        helper.choice_num(fake_match7).should eql(7)
        helper.choice_num(fake_match8).should eql(8)
    end
end