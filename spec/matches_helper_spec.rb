require "spec_helper"

describe MatchesHelper, :type => :helper do

    it 'returns the project preference number' do
        fake_project1 = Project.create(:project_name => "Project1", :id => 1)
        fake_project2 = Project.create(:project_name => "Project2", :id => 2)
        fake_project3 = Project.create(:project_name => "Project3", :id => 3)
        fake_project4 = Project.create(:project_name => "Project4", :id => 4)
        fake_project5 = Project.create(:project_name => "Project5", :id => 5)
        fake_project6 = Project.create(:project_name => "Project6", :id => 6)
        fake_project7 = Project.create(:project_name => "Project7", :id => 7)
        fake_project8 = Project.create(:project_name => "Project8", :id => 8)

        fake_group1 = Group.create(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)

        fake_match1 = Match.new(:project_id => 1, :group_id => 1)
        fake_match2 = Match.new(:project_id => 2, :group_id => 1)
        fake_match3 = Match.new(:project_id => 3, :group_id => 1)
        fake_match4 = Match.new(:project_id => 4, :group_id => 1)
        fake_match5 = Match.new(:project_id => 5, :group_id => 1)
        fake_match6 = Match.new(:project_id => 6, :group_id => 1)
        fake_match7 = Match.new(:project_id => 7, :group_id => 1)
        fake_match8 = Match.new(:project_id => 8, :group_id => 1)

        helper.choice_num(fake_match1).should eql(1)
        helper.choice_num(fake_match2).should eql(2)
        helper.choice_num(fake_match3).should eql(3)
        helper.choice_num(fake_match4).should eql(4)
        helper.choice_num(fake_match5).should eql(5)
        helper.choice_num(fake_match6).should eql(6)
        helper.choice_num(fake_match7).should eql(7)
        helper.choice_num(fake_match8).should eql(8)
    end

    it 'finds the right background color for the rank' do
        fake_project1 = Project.new(:project_name => "Project1", :id => 1)
        fake_project2 = Project.new(:project_name => "Project2", :id => 2)
        fake_project3 = Project.new(:project_name => "Project3", :id => 3)
        fake_project4 = Project.new(:project_name => "Project4", :id => 4)
        fake_project5 = Project.new(:project_name => "Project5", :id => 5)
        fake_project6 = Project.new(:project_name => "Project6", :id => 6)
        fake_project7 = Project.new(:project_name => "Project7", :id => 7)

        allow(Project).to receive(:find_by).with(:project_id => 1) { fake_project1 }
        allow(Project).to receive(:find_by).with(:project_id => 2) { fake_project2 }
        allow(Project).to receive(:find_by).with(:project_id => 3) { fake_project3 }
        allow(Project).to receive(:find_by).with(:project_id => 4) { fake_project4 }
        allow(Project).to receive(:find_by).with(:project_id => 5) { fake_project5 }
        allow(Project).to receive(:find_by).with(:project_id => 6) { fake_project6 }
        allow(Project).to receive(:find_by).with(:project_id => 7) { fake_project7 }
        
        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)
        
        allow(Group).to receive(:where).with(:group_id => 1) { [fake_group1] }
        
        fake_match1 = Match.new(:project_id => 1, :group_id => 1)
        fake_match2 = Match.new(:project_id => 5, :group_id => 1)
        fake_match3 = Match.new(:project_id => 7, :group_id => 1)
        
        helper.should_receive(:choice_num).with(fake_match1).and_return(1)
        helper.should_receive(:choice_num).with(fake_match2).and_return(5)
        helper.should_receive(:choice_num).with(fake_match3).and_return(7)
        
        helper.rank_color(fake_match1).should eql("bg-green")
        helper.rank_color(fake_match2).should eql("bg-yellow")
        helper.rank_color(fake_match3).should eql("bg-red")
        
    end
end