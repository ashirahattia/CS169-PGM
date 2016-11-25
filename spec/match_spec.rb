require "spec_helper"

describe Match, :type => :model do
    it 'generates a preference list' do
        dummy_group = Group.create(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)
        Match.generate_preference_list(dummy_group).should eql([1, 2, 3, 4, 5, 6, 7])
    end
    
    it 'runs the hungarian algorithm' do
        fake_projects = [Project.new(:project_name => "Project1", :id => 1), 
                         Project.new(:project_name => "Project2", :id => 2), 
                         Project.new(:project_name => "Project3", :id => 3)]
        allow(Project).to receive(:all){fake_projects}
        fake_groups = [Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3), 
                       Group.new(:group_name => "Group2", :id => 2, :first_choice => 2, :second_choice => 3, :third_choice => 1), 
                       Group.new(:group_name => "Group3", :id => 3, :first_choice => 3, :second_choice => 1, :third_choice => 2)]
        allow(Group).to receive(:all){fake_groups}
        Match.algorithm(:quadratic, 2)
        expect(Match.all).to_not be_nil
    end
    
    it 'does not run the algorithm if groups or projects is empty' do
        Match.instance_variable_set("@all_groups", [])
        expect(Match.algorithm(:quadratic, 2)).to be_nil
    end
    
    it 'generates dummies when there are more projects than groups' do
        fake_projects = [Project.new(:project_name => "Project1", :id => 1), 
                         Project.new(:project_name => "Project2", :id => 2), 
                         Project.new(:project_name => "Project3", :id => 3)]
        allow(Project).to receive(:all){fake_projects}
        fake_groups = [Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2), 
                       Group.new(:group_name => "Group2", :id => 2, :first_choice => 2, :second_choice => 3)]
        allow(Group).to receive(:all){fake_groups}
        Match.algorithm(:quadratic, 2)
        expect(Match.all).to_not be_nil
    end
        
end