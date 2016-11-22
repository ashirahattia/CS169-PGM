require "spec_helper"

describe GroupsController, :type => :controller do
  it 'produces an index' do
    fake_groups = [Group.new(:id =>1, :group_name=>"Test1"), Group.new(:id =>1, :group_name=>"Test2")]
    allow(Group).to receive(:all) { fake_groups }
    controller.index
    expect(assigns(@groups)[:groups]).to eq(fake_groups)
  end
  
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
  
  it 'redirects if preferences are not unique' do
    fake_project = Project.new(:project_name => "Project1", :id => 1)
    fake_group = Group.new(:id => 1, :group_name => "Test")
    allow(Group).to receive(:find) { fake_group }
    allow(Project).to receive(:all) { [fake_project] }
    controller.params = {:id=> 1, :first_choice => 1, :second_choice => 1}
    controller.should_receive(:redirect_to).with("/groups/1")
    controller.update
  end
  
  it 'destroys a single group' do
    fake_group = Group.new(:id => 1, :group_name => "Test")
    fake_project = Project.new(:id => 1, :project_name => "Test")
    fake_match = Match.new(:group_name => "Test", :project_name => "Test", :id => 1)
    controller.params = {:id => 1}
    allow(Group).to receive(:find) { fake_group }
    allow(Match).to receive(:all) { [fake_match] }
    controller.should_receive(:redirect_to).with(:groups).and_return(true)
    (Group).should_receive(:destroy).with(fake_group[:id]).and_return(true)
    (Match).should_receive(:destroy).with(fake_group[:id]).and_return(true)
    controller.destroy
  end

  it 'destroys multiple groups' do
    fake_group1 = Group.new(:id =>1, :group_name=>"Test1")
    fake_group2 = Group.new(:id =>2, :group_name=>"Test2")
    allow(Group).to receive(:find).with("1") { fake_group1 }
    allow(Group).to receive(:find).with("2") { fake_group2 }
    controller.params = {:delete => {'1': 1, '2': 1}}
    (Group).should_receive(:destroy).with('1').and_return(true)
    (Group).should_receive(:destroy).with('2').and_return(true)
    (Match).should_receive(:destroy_all).and_return(true)
    controller.should_receive(:redirect_to).with(:groups).and_return(true)
    controller.destroy_multiple
  end
  
  it 'rescues errors in destroy_multiple when no groups are selected for deletion' do
    controller.should_receive(:redirect_to).with(:groups).and_return(true)
    controller.destroy_multiple
    expect(flash[:notice]).to be_present
  end
  
  it 'rescues errors in destroy when no groups are selected for deletion' do
    controller.params = {:id=>nil}
    controller.should_receive(:redirect_to).with(:groups).and_return(true)
    controller.destroy
    expect(flash[:notice]).to be_present
  end
end
