Then(/^a (.*) project should exist$/) do |name|
  Project.where(project_name: name).should_not be_nil
end

And(/^all Groups should have preferences$/) do
  pending
end

And(/^I input the group information$/) do
  pending
end

And(/^I set the group preferences/) do
  pending
end

Then(/^the new group should exist with my preferences set$/) do
  pending
end

And(/^I should see a warning label$/) do
  page.should_not have_css("warning")
end

Then(/^I select the first group$/) do
  check("#delete_1")
end

Then(/^Group should not have the first group$/) do
  pending
end

And(/^I input the project information$/) do
  fill_in 'project_name', :with => 'Test Project'
end

Then(/^I can see a add_project table$/) do
  pending
end


Given(/^I have logged in$/) do
  visit("/login")
  fill_in("password", :with => "TA")
  click_button("submit")
end

Given(/^I have logged out$/) do
  visit("/login")
  click_button("Log out")
end

And(/^all Projects should have names$/) do
  pending
end

And(/^I see the (.*) (.*) empty$/) do |object, zero|
  case object
    when 'groups'
      check_count Group.count, zero
    when 'projects'
      check_count Project.count, zero
  end
end

def check_count(count, zero)
  if zero == 'is'
    count.should eql(0)
  else
    count.should_not eql(0)
  end
end

And(/^I might be on authentication page$/) do
  visit("/google/authorize")
  fill_in('code', :with => 'TEST')
  Group.create
  Project.create
  click_button('submit')
end

And(/^All data is put into the database$/) do
  response = [
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
      ["21", "ORAM"],
      ["22", "Orinda Police Department"],
      ["23", "San Francisco Bay Bird observatory"],
      ["24", "Sankara Eye Foundation"],
      ["25", "TAGS (Hint Creation)"],
      ["26", "TAGS (Model Creation)"],
      ["27", "The Arctic Institute"],
      ["28", "UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)"],
      ["29", "UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
      ["30", "UC Berkeley - EECS Department - CS 169 (ProjectScope)"],
      ["31", "UC Berkeley - EECS Department - CS 169 (Team Enrollment)"],
      ["32", "UC Berkeley Family Student Housing"],
      ["33", "UC Berkeley: Educational Technology Services"],
      ["34", "Visionaria Network"]]
  response.each do |row|
    Project.create(:id => row[0], :project_name => row[1])
  end
  response_groups = [
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
       "33 UC Berkeley: Educational Technology Services"],
      ["9/16/2016 14:07:20",
       "xiangyu.ren@berkeley.edu",
       "5",
       "22 Orinda Police Department",
       "2 Alzheimer's Greater Los Angeles",
       "15 esential",
       "22 Orinda Police Department",
       "32 UC Berkeley Family Student Housing",
       "8 China US Culture Exchange Center",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "6 Breathe California"],
      ["9/20/2016 17:10:46",
       "hubqwerty@berkeley.edu",
       "6",
       "15 esential",
       "15 esential",
       "12 Da-Tong Society of China Studies",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "10 CITY DOG SHARE (Dog Profile App)",
       "13 Effective Altruists of Berkeley",
       "9 CITY DOG SHARE (Calendar App)",
       "11 CommunityGrows"],
      ["9/18/2016 13:05:35",
       "wangxiangjiu@berkeley.edu",
       "7",
       "6 Breathe California",
       "6 Breathe California",
       "23 San Francisco Bay Bird observatory",
       "17 health4theworld.org",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "22 Orinda Police Department",
       "32 UC Berkeley Family Student Housing",
       "34 Visionaria Network"],
      ["9/19/2016 10:25:35",
       "kryuma@berkeley.edu",
       "8",
       "8 China US Culture Exchange Center",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "8 China US Culture Exchange Center",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "15 esential",
       "21 ORAM",
       "22 Orinda Police Department",
       "10 CITY DOG SHARE (Dog Profile App)"],
      ["9/20/2016 18:34:17",
       "njazari@berkeley.edu",
       "9",
       "24 Sankara Eye Foundation",
       "22 Orinda Police Department",
       "33 UC Berkeley: Educational Technology Services",
       "24 Sankara Eye Foundation",
       "19 Institute of Personality and Social Research",
       "8 China US Culture Exchange Center",
       "13 Effective Altruists of Berkeley",
       "20 IntegrateNYC4Me"],
      ["9/20/2016 0:16:21",
       "lizzysteger@berkeley.edu",
       "10",
       "12 Da-Tong Society of China Studies",
       "12 Da-Tong Society of China Studies",
       "32 UC Berkeley Family Student Housing",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "3 American Red Cross at Cal",
       "7 California Poets in the Schools",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "25 TAGS (Hint Creation)"],
      ["9/20/2016 12:02:09",
       "kadhirvelm@berkeley.edu",
       "11",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "28 UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)",
       "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
       "13 Effective Altruists of Berkeley",
       "7 California Poets in the Schools",
       "6 Breathe California"],
      ["9/20/2016 12:46:42",
       "gunsoo02@berkeley.edu",
       "12",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "23 San Francisco Bay Bird observatory",
       "6 Breathe California",
       "19 Institute of Personality and Social Research",
       "22 Orinda Police Department",
       "27 The Arctic Institute",
       "3 American Red Cross at Cal"],
      ["9/16/2016 16:19:59",
       "kailiyen@berkeley.edu",
       "13",
       "21 ORAM",
       "21 ORAM",
       "5 AsylumConnect",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "20 IntegrateNYC4Me",
       "27 The Arctic Institute",
       "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)"],
      ["9/20/2016 9:17:08",
       "hiftekhar@berkeley.edu",
       "14",
       "3 American Red Cross at Cal",
       "10 CITY DOG SHARE (Dog Profile App)",
       "3 American Red Cross at Cal",
       "23 San Francisco Bay Bird observatory",
       "7 California Poets in the Schools",
       "27 The Arctic Institute",
       "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
       "11 CommunityGrows"],
      ["9/20/2016 15:42:53",
       "mingu08@berkeley.edu",
       "15",
       "32 UC Berkeley Family Student Housing",
       "32 UC Berkeley Family Student Housing",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "9 CITY DOG SHARE (Calendar App)",
       "28 UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)",
       "15 esential",
       "33 UC Berkeley: Educational Technology Services",
       "14 Engineers Without Borders - San Francisco Professional Chapter"],
      ["9/15/2016 0:00:36",
       "stevencheng@berkeley.edu",
       "16",
       "9 CITY DOG SHARE (Calendar App)",
       "9 CITY DOG SHARE (Calendar App)",
       "10 CITY DOG SHARE (Dog Profile App)",
       "2 Alzheimer's Greater Los Angeles",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "28 UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)",
       "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)"],
      ["9/20/2016 22:46:40",
       "ross.teixeira@berkeley.edu",
       "17",
       "13 Effective Altruists of Berkeley",
       "13 Effective Altruists of Berkeley",
       "22 Orinda Police Department",
       "2 Alzheimer's Greater Los Angeles",
       "10 CITY DOG SHARE (Dog Profile App)",
       "32 UC Berkeley Family Student Housing",
       "7 California Poets in the Schools",
       "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)"],
      ["9/18/2016 19:08:37",
       "dasolyoon@berkeley.edu",
       "18",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "33 UC Berkeley: Educational Technology Services",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "32 UC Berkeley Family Student Housing",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "28 UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)",
       "13 Effective Altruists of Berkeley"],
      ["9/14/2016 23:59:07",
       "akuo5@berkeley.edu",
       "19",
       "10 CITY DOG SHARE (Dog Profile App)",
       "10 CITY DOG SHARE (Dog Profile App)",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "22 Orinda Police Department",
       "23 San Francisco Bay Bird observatory",
       "9 CITY DOG SHARE (Calendar App)",
       "15 esential",
       "3 American Red Cross at Cal"],
      ["9/20/2016 23:18:18",
       "jessheisme@berkeley.edu",
       "20",
       "34 Visionaria Network",
       "2 Alzheimer's Greater Los Angeles",
       "12 Da-Tong Society of China Studies",
       "15 esential",
       "10 CITY DOG SHARE (Dog Profile App)",
       "13 Effective Altruists of Berkeley",
       "34 Visionaria Network",
       "14 Engineers Without Borders - San Francisco Professional Chapter"],
      ["9/20/2016 21:55:33",
       "floresivette@berkeley.edu",
       "21",
       "7 California Poets in the Schools",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "12 Da-Tong Society of China Studies",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "32 UC Berkeley Family Student Housing",
       "22 Orinda Police Department",
       "1 Alameda and Contra Costa Counties Optometric Society (ACCCOS)",
       "7 California Poets in the Schools"],
      ["9/20/2016 0:03:26",
       "wongdaniel8@berkeley.edu",
       "22",
       "2 Alzheimer's Greater Los Angeles",
       "2 Alzheimer's Greater Los Angeles",
       "21 ORAM",
       "33 UC Berkeley: Educational Technology Services",
       "11 CommunityGrows",
       "17 health4theworld.org",
       "10 CITY DOG SHARE (Dog Profile App)",
       "19 Institute of Personality and Social Research"],
      ["9/20/2016 17:32:16",
       "mcraig@berkeley.edu",
       "23",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "5 AsylumConnect",
       "27 The Arctic Institute",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "33 UC Berkeley: Educational Technology Services",
       "23 San Francisco Bay Bird observatory",
       "20 IntegrateNYC4Me"],
      ["9/19/2016 21:44:46",
       "tusharsingal@berkeley.edu",
       "24",
       "19 Institute of Personality and Social Research",
       "29 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "30 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
       "22 Orinda Police Department",
       "6 Breathe California",
       "19 Institute of Personality and Social Research"],
      ["9/18/2016 22:24:41",
       "shuoyao@berkeley.edu",
       "25",
       "23 San Francisco Bay Bird observatory",
       "23 San Francisco Bay Bird observatory",
       "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
       "2 Alzheimer's Greater Los Angeles",
       "27 The Arctic Institute",
       "13 Effective Altruists of Berkeley",
       "34 Visionaria Network",
       "3 American Red Cross at Cal"],
      ["9/19/2016 23:46:19",
       "theguo007@berkeley.edu",
       "26",
       "5 AsylumConnect",
       "5 AsylumConnect",
       "15 esential",
       "10 CITY DOG SHARE (Dog Profile App)",
       "9 CITY DOG SHARE (Calendar App)",
       "12 Da-Tong Society of China Studies",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "2 Alzheimer's Greater Los Angeles"],
      ["9/20/2016 22:38:28",
       "victorhlu@berkeley.edu",
       "28",
       "33 UC Berkeley: Educational Technology Services",
       "33 UC Berkeley: Educational Technology Services",
       "6 Breathe California",
       "19 Institute of Personality and Social Research",
       "31 UC Berkeley - EECS Department - CS 169 (Team Enrollment)",
       "23 San Francisco Bay Bird observatory",
       "28 UC Berkeley - EECS Department - CS 169 (CourseQuestionBank)",
       "10 CITY DOG SHARE (Dog Profile App)"],
      ["9/18/2016 19:28:24",
       "s.keegan@berkeley.edu",
       "29",
       "16 Faludi Design",
       "8 China US Culture Exchange Center",
       "16 Faludi Design",
       "14 Engineers Without Borders - San Francisco Professional Chapter",
       "22 Orinda Police Department",
       "23 San Francisco Bay Bird observatory",
       "27 The Arctic Institute",
       "9 CITY DOG SHARE (Calendar App)"]]
  response.each do |row|
    preferences = []
    preference_rows = row.drop(4)
    preference_rows.each do |preference|
      preferences.push((/\d+/.match(preference))[0])
    end
    Group.create(:group_name => row[2], :created_at => row[0], :id => row[2], :username => row[1],
                 :first_choice => preferences[0], :second_choice => preferences[1], :third_choice => preferences[2],
                 :fourth_choice => preferences[3], :fifth_choice => preferences[4], :sixth_choice => preferences[5],
                 :seventh_choice => preferences[6])
  end
end