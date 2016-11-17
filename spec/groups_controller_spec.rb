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
  
  it 'updates group preferences' do
    fake_project1 = Project.new(:project_name => "Project1", :id => 1)
    fake_project2 = Project.new(:project_name => "Project2", :id => 2)
    fake_project3 = Project.new(:project_name => "Project3", :id => 3)
    fake_project4 = Project.new(:project_name => "Project4", :id => 4)
    fake_project5 = Project.new(:project_name => "Project5", :id => 5)
    fake_project6 = Project.new(:project_name => "Project6", :id => 6)
    fake_project7 = Project.new(:project_name => "Project7", :id => 7)
    fake_group = Group.new(:id => 1, :group_name => "Test")
    allow(Group).to receive(:find) { fake_group }
    allow(Project).to receive(:all) { [fake_project1, fake_project2, fake_project3, fake_project4, fake_project5, fake_project6, fake_project7] }
    controller.should_receive(:redirect_to).with(:groups).and_return(true)
    controller.params = {:id=> 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7}
    controller.update
    expect(assigns(@groups)[:group]).to eq(fake_group)
    expect(assigns(@projects)[:projects]).to eq([fake_project1, fake_project2, fake_project3, fake_project4, fake_project5, fake_project6, fake_project7])
    expect(assigns(@groups)[:group][:first_choice]).to eq(fake_project1[:id])
    expect(assigns(@groups)[:group][:second_choice]).to eq(fake_project2[:id])
    expect(assigns(@groups)[:group][:third_choice]).to eq(fake_project3[:id])
  end

end