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
    controller.should_receive(:redirect_to).with(google_fetch_path)
    controller.complete_authorization
    expect(flash[:notice]).to eq('Error, invalid code. Try again')
  end

  it 'checks force reloading authorization' do
    controller.should_receive(:redirect_to).with(google_fetch_path).twice
    controller.check_authorization
    expect(session[:is_authorized]).to_not eq(true)
    controller.authorize(true)
  end

  it 'checks for project and group data filled' do
    @@SETTINGS = create_settings
    put :save_preferences
    response = double("project")
    response.stub(:values) { dummy_project_data_values_with_headers }
    response.stub(:values=) {dummy_project_data_values}
    controller.adjust_projects(response)
    response_groups = double("groups")
    response_groups.stub(:values) { dummy_group_with_headers }
    response_groups.stub(:values=) { dummy_group_data_values }
    controller.should_receive(:redirect_to).with(root_path)
    controller.adjust_groups(response_groups)
  end

  it 'fetches project and group data' do
    @@SETTINGS = create_settings
    stub_values double("project"), dummy_project_data_values_with_headers, dummy_project_data_values
    stub_values double("group"), dummy_group_with_headers, dummy_group_data_values
    controller.should_receive(:redirect_to).with(google_fetch_path)
    controller.projects_groups_fetch
  end

  def stub_values (response, first_set, second_set)
    response.stub(:values) { first_set }
    response.stub(:values=) { second_set }
    service = double("service")
    service.stub(:get_spreadsheet_values) { response }
    controller.should_receive(:service_authorize).and_return(service)
  end

  def create_settings
    Setting.create(:spreadsheet_id => '1kPwI0T6PnmVT9TF7QqDa1TWsKlnNRG2sXGBsnhWv7AI',
                   :group_tab => 'Groups!A1:Y1000',
                   :group_username_col => '1',
                   :group_id_col => '2',
                   :group_preference_1 => '4',
                   :group_preference_2 => '5',
                   :group_preference_3 => '6',
                   :group_preference_4 => '7',
                   :group_preference_5 => '8',
                   :group_preference_6 => '9',
                   :group_preference_7 => '10',
                   :project_tab => 'Projects',
                   :project_id_col => '0',
                   :project_name_col => '1',
                   :matches_tab => 'Current_Match')
  end

end