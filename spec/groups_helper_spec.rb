require "spec_helper"

describe GroupsHelper, :type => :helper do
    it 'returns the project preference name' do
        fake_project = Project.new(:project_name => "Project1", :id => 1)
        allow(Project).to receive(:find) { fake_project }
        
        @group = {:first_choice => fake_project.id,:second_choice => nil}
        helper.choice_str(:second_choice).should eql("not chosen")
        helper.choice_str(:first_choice).should eql("Project1")
    end
end