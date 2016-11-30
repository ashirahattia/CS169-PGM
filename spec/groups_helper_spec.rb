require "spec_helper"

describe GroupsHelper, :type => :helper do
    it 'returns the project preference name' do
        fake_project = Project.new(:project_name => "Project1", :id => 1)
        allow(Project).to receive(:find) { fake_project }
        
        @group = {:first_choice => fake_project.id,:second_choice => nil}
        helper.choice_str(:second_choice).should eql("not chosen")
        helper.choice_str(:first_choice).should eql("Project1")
    end
    
        it 'selects if needed' do
        helper.select_if_needed(1, 1).should eql(", selected=selected")
        helper.select_if_needed(1, 2).should eql("")
    end
    
    it 'gets the current force matched project' do
        group_without_force_match = Group.new()
        group_with_force_match = Group.new()
        project_match = Project.new(:project_name => "i like poop")
        allow(group_with_force_match).to receive(:force_matched_project) {project_match}
        
        @group = group_without_force_match
        helper.current_force_matched_project.should eql("None")
        
        @group = group_with_force_match
        helper.current_force_matched_project.should eql("i like poop")
    end
end