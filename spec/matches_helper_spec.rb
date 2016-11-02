require "spec_helper"

describe MatchesHelper, :type => :helper do
    it 'returns the project preference number' do
        fake_project1 = Project.new(:project_name => "Project1", :id => 1)
        fake_project2 = Project.new(:project_name => "Project2", :id => 2)
        fake_project3 = Project.new(:project_name => "Project3", :id => 3)
        
        allow(Project).to receive(:find_by).with(:project_name => "Project1") { fake_project1 }
        allow(Project).to receive(:find_by).with(:project_name => "Project2") { fake_project2 }
        allow(Project).to receive(:find_by).with(:project_name => "Project3") { fake_project3 }
        
        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3)
        fake_group2 = Group.new(:group_name => "Group2", :id => 2, :first_choice => 1, :second_choice => 2, :third_choice => 3)
        fake_group3 = Group.new(:group_name => "Group3", :id => 3, :first_choice => 2, :second_choice => 1, :third_choice => 3)
        fake_group4 = Group.new(:group_name => "Group4", :id => 4)
        
        allow(Group).to receive(:where).with(:group_name => "Group1") { [fake_group1] }
        allow(Group).to receive(:where).with(:group_name => "Group2") { [fake_group2] }
        allow(Group).to receive(:where).with(:group_name => "Group3") { [fake_group3] }
        allow(Group).to receive(:where).with(:group_name => "Group4") { [fake_group4] }
        
        fake_match1 = Match.new(:project_name => "Project1", :group_name => "Group1")
        fake_match2 = Match.new(:project_name => "Project2", :group_name => "Group2")
        fake_match3 = Match.new(:project_name => "Project3", :group_name => "Group3")
        fake_match4 = Match.new(:project_name => "Project1", :group_name => "Group4")
        
        helper.choice_num(fake_match1).should eql(1)
        helper.choice_num(fake_match2).should eql(2)
        helper.choice_num(fake_match3).should eql(3)
        helper.choice_num(fake_match4).should eql("Not a top choice")
    end
end