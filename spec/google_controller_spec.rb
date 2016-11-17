require "spec_helper"

describe GoogleController, :type => :controller do
  it 'checks for authorization URL' do
    controller.get_authorization
    expect(session[:authorize]).to_not eq(nil)
  end

  it 'checks for completion of authorization' do
    controller.params = {:code => 'Test'}
    controller.complete_authorization
    expect(flash[:notice]).to_not eq(nil)
  end


  it 'checks for project data filled' do
    response = double("project")
    response.stub(:values) { dummy_project_data_values_with_headers }
    response.stub(:values=) {dummy_project_data_values}

    controller.should_receive(:redirect_to).with(projects_path)
    controller.adjust_projects(response)
    response_groups = double("groups")
    response_groups.stub(:values) { dummy_group_data_values_with_headers }
    response_groups.stub(:values=) { dummy_group_data_values }
    controller.should_receive(:redirect_to).with(groups_path)
    controller.adjust_groups(response_groups)
  end

end