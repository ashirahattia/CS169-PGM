require "spec_helper"

describe GroupsController, :type => :controller do
  it 'returns the group with the id and all the projects' do
    fake_project = Project.new(:project_name => "Project1", :id => 1)
    fake_group = Group.new(:id => 1, :group_name => "Test")
    allow(Group).to receive(:find) { fake_group }
    allow(Project).to receive(:all) { [fake_project] }
    controller.show
    expect(assigns(@group)["group"]).to eq(fake_group)
    expect(assigns(@projects)["projects"]).to eq([fake_project])
  end

end