require "spec_helper"

describe GoogleController, :type => :controller do
  it 'checks for authorization URL' do
    controller.get_authorization
    expect(session[:authorize]).to_not eq(nil)
  end

  # it 'goes for authorization' do
  #   controller.should redirect_to(google_authorize_path)
  #   controller.authorize(true)
  # end
  #
  # it 'goes for service authorization' do
  #   controller.should redirect_to(google_authorize_path)
  #   controller.service_authorize
  # end

  it 'checks for completion of authorization' do
    controller.params = {:code => 'Test'}
    controller.complete_authorization
    expect(flash[:notice]).to_not eq(nil)
  end

  it 'does project fetch' do
    response = double("project")
    response.stub(:values) { dummy_project_data_values_with_headers }
    response.stub(:values=) {dummy_project_data_values}
    controller.should_receive(:fetch_project_data).and_return(response)
    controller.projects_fetch
  end

  it 'does group fetch' do
    response = double("group")
    controller.should_receive(:fetch_group_data).and_return(response)
    controller.projects_groups_fetch
  end

  it 'checks for project data filled' do
    response = double("project")
    response.stub(:values) { dummy_project_data_values_with_headers }
    response.stub(:values=) {dummy_project_data_values}
    controller.should_receive(:redirect_to).with(projects_path)
    controller.adjust_projects(response)
    response_groups = double("groups")
    response_groups.stub(:values) { dummy_group_with_headers }
    response_groups.stub(:values=) { dummy_group_data_values }
    controller.should_receive(:redirect_to).with(groups_path)
    controller.adjust_groups(response_groups)
  end

  it 'fetches group data' do
    stub_values double("group"), dummy_group_with_headers, dummy_group_data_values
    controller.should_receive(:adjust_groups).and_return(true)
    controller.fetch_group_data
  end

  def stub_values (response, first_set, second_set)
    response.stub(:values) { first_set }
    response.stub(:values=) { second_set }
    service = double("service")
    service.stub(:get_spreadsheet_values) { response }
    controller.should_receive(:service_authorize).and_return(service)
  end

  it 'fetches project data' do
    stub_values double("project"), dummy_project_data_values_with_headers, dummy_project_data_values
    controller.should_receive(:adjust_projects).and_return(true)
    controller.fetch_project_data
  end

end