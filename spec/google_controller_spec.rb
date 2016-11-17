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
    controller.groups_fetch
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

  it 'fetches group data' do
    response = double("group")
    response.stub(:values) { dummy_group_data_values_with_headers }
    response.stub(:values=) { dummy_group_data_values }
    service = double("service")
    service.stub(:get_spreadsheet_values) { response}
    controller.should_receive(:service_authorize).and_return(service)
    controller.should_receive(:adjust_groups).and_return(true)
    controller.fetch_group_data
  end

  it 'fetches project data' do
    response = double("project")
    response.stub(:values) { dummy_project_data_values_with_headers }
    response.stub(:values=) { dummy_project_data_values }
    service = double("service")
    service.stub(:get_spreadsheet_values) { response}
    controller.should_receive(:service_authorize).and_return(service)
    controller.should_receive(:adjust_projects).and_return(true)
    controller.fetch_project_data
  end

  def dummy_project_data_values
    return [
        ["1", "Alameda and Contra Costa Counties Optometric Society (ACCCOS)"],
        ["2", "Alzheimer's Greater Los Angeles"],
        ["3", "American Red Cross at Cal"],
        ["4", "Armando Fox - Altarena Playhouse & Custom Made Theater Co"],
        ["5", "AsylumConnect"],
        ["6", "Breathe California"],
        ["7", "California Poets in the Schools"],
        ["8", "China US Culture Exchange Center"],
        ["9", "CITY DOG SHARE (Calendar App)"],
        ["10", "CITY DOG SHARE (Dog Profile App)"],
        ["11", "CommunityGrows"],
        ["12", "Da-Tong Society of China Studies"],
        ["13", "Effective Altruists of Berkeley"],
        ["14", "Engineers Without Borders - San Francisco Professional Chapter"],
        ["15", "esential"],
        ["16", "Faludi Design"],
        ["17", "health4theworld.org"],
        ["18", "In the Potters Hands"],
        ["19", "Institute of Personality and Social Research"],
        ["20", "IntegrateNYC4Me"],
        ["21", "ORAM"]]
  end

  def dummy_project_data_values_with_headers
    return [["HEADERS HERE"],
        ["1", "Alameda and Contra Costa Counties Optometric Society (ACCCOS)"],
        ["2", "Alzheimer's Greater Los Angeles"],
        ["3", "American Red Cross at Cal"],
        ["4", "Armando Fox - Altarena Playhouse & Custom Made Theater Co"],
        ["5", "AsylumConnect"],
        ["6", "Breathe California"],
        ["7", "California Poets in the Schools"],
        ["8", "China US Culture Exchange Center"],
        ["9", "CITY DOG SHARE (Calendar App)"],
        ["10", "CITY DOG SHARE (Dog Profile App)"],
        ["11", "CommunityGrows"],
        ["12", "Da-Tong Society of China Studies"],
        ["13", "Effective Altruists of Berkeley"],
        ["14", "Engineers Without Borders - San Francisco Professional Chapter"],
        ["15", "esential"],
        ["16", "Faludi Design"],
        ["17", "health4theworld.org"],
        ["18", "In the Potters Hands"],
        ["19", "Institute of Personality and Social Research"],
        ["20", "IntegrateNYC4Me"],
        ["21", "ORAM"]]
  end

  def dummy_group_data_values
    [["9/16/2016 16:19:38",
      "yanxinyi@berkeley.edu",
      "1",
      "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
      "15 esential",
      "9 CITY DOG SHARE (Calendar App)",
      "23 San Francisco Bay Bird observatory",
      "10 CITY DOG SHARE (Dog Profile App)",
      "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
     ["9/15/2016 10:57:54",
      "jsullivan27@berkeley.edu",
      "2",
      "11 CommunityGrows",
      "11 CommunityGrows",
      "22 Orinda Police Department",
      "5 AsylumConnect",
      "9 CITY DOG SHARE (Calendar App)",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "13 Effective Altruists of Berkeley",
      "27 The Arctic Institute"],
     ["9/20/2016 21:31:53",
      "aditya2013@berkeley.edu",
      "3",
      "27 The Arctic Institute",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "10 CITY DOG SHARE (Dog Profile App)",
      "27 The Arctic Institute",
      "23 San Francisco Bay Bird observatory",
      "33 UC Berkeley: Educational Technology Services",
      "22 Orinda Police Department",
      "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
     ["9/20/2016 15:48:34",
      "junyuw@berkeley.edu",
      "4",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "10 CITY DOG SHARE (Dog Profile App)",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "9 CITY DOG SHARE (Calendar App)",
      "32 UC Berkeley Family Student Housing",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "11 CommunityGrows",
      "33 UC Berkeley: Educational Technology Services"]]
  end

  def dummy_group_data_values_with_headers
    [["Timestamp",
      "Email Address",
      "What is your team ID?",
      "Assigned",
      "1st preference:",
      "2nd preference:",
      "3rd preference:",
      "4th preference:",
      "5th preference:",
      "6th preference",
      "7th preference"],
     ["9/16/2016 16:19:38",
      "yanxinyi@berkeley.edu",
      "1",
      "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
      "15 esential",
      "9 CITY DOG SHARE (Calendar App)",
      "23 San Francisco Bay Bird observatory",
      "10 CITY DOG SHARE (Dog Profile App)",
      "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
     ["9/15/2016 10:57:54",
      "jsullivan27@berkeley.edu",
      "2",
      "11 CommunityGrows",
      "11 CommunityGrows",
      "22 Orinda Police Department",
      "5 AsylumConnect",
      "9 CITY DOG SHARE (Calendar App)",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "13 Effective Altruists of Berkeley",
      "27 The Arctic Institute"],
     ["9/20/2016 21:31:53",
      "aditya2013@berkeley.edu",
      "3",
      "27 The Arctic Institute",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "10 CITY DOG SHARE (Dog Profile App)",
      "27 The Arctic Institute",
      "23 San Francisco Bay Bird observatory",
      "33 UC Berkeley: Educational Technology Services",
      "22 Orinda Police Department",
      "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
     ["9/20/2016 15:48:34",
      "junyuw@berkeley.edu",
      "4",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "10 CITY DOG SHARE (Dog Profile App)",
      "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
      "9 CITY DOG SHARE (Calendar App)",
      "32 UC Berkeley Family Student Housing",
      "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
      "11 CommunityGrows",
      "33 UC Berkeley: Educational Technology Services"]]
  end

end