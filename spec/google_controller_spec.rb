require "spec_helper"

describe GoogleController, :type => :controller do
  
  before(:each) do
    @@SETTINGS = create_settings
  end
  
  it 'checks for authorization URL' do
    controller.get_authorization
    expect(session[:authorize]).to_not eq(nil)
  end

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
    stub_values double("project"), dummy_project_data_values_with_headers, dummy_project_data_values
    stub_values double("group"), dummy_group_with_headers, dummy_group_data_values
    controller.should_receive(:redirect_to).with(google_fetch_path).exactly(3).times
    controller.projects_groups_fetch
    controller.fetch_project_data.should eql(false)
  end

  it 'tries to get authorization' do
    controller.should_receive(:redirect_to).with(google_fetch_path)
    controller.service_authorize.should_not eql(nil)
  end

  it 'tries to fetch data and write matches' do
    controller.should_receive(:redirect_to).with(google_fetch_path).exactly(4).times
    controller.fetch_data('None')
    controller.write_all_matches
  end

  def stub_values (response, first_set, second_set)
    response.stub(:values) { first_set }
    response.stub(:values=) { second_set }
    service = double("service")
    service.stub(:get_spreadsheet_values) { response }
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
  
  context "some extra tests" do
    before(:each) do
      allow(controller).to receive(:authorize) {true}
      allow(controller).to receive(:fetch_data) {[1, 2, 3]}
      allow(controller).to receive(:adjust_projects) {[4, 5, 6]}
      allow(controller).to receive(:adjust_groups) {[7, 8, 9]}
    end
  
    it 'projects_groups_fetch' do
      # expect(controller).to receive(:check_authorization) {true}
      # expect(controller).to receive(:fetch_project_data) {true}
      controller.projects_groups_fetch.should eql([7,8,9])
    end
  end

end