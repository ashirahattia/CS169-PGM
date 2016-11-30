require "././spec/spec_helper"
require 'cucumber/rspec/doubles'

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
  check("delete[2]")
end

Then(/^Group should not have the first group$/) do
  page.should_not have_content("delete[2]")
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

And(/^I fill in the authentication page$/) do
  fill_in('code', :with => 'TEST')
  Group.create
  Project.create
  click_button('submit')
end

And(/^All data is put into the database$/) do
  put ('/google/settings')
  response_projects = dummy_project_data_values
  response_projects.each do |row|
    Project.create(:id => row[0], :project_name => row[1])
  end
  response_groups = double("group")
  response_groups.stub(:values) { dummy_group_data_values }
  GoogleController.new.create_groups(response_groups)
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

And(/^I fill in the google settings$/) do
  create_settings
  visit('/google/settings')
  find_field('spreadsheet_id').should_not be_nil
  fill_in('spreadsheet_id', :with => '1kPwI0T6PnmVT9TF7QqDa1TWsKlnNRG2sXGBsnhWv7AI')
  fill_in('group_tab', :with => 'Groups!A1:Y1000')
  fill_in('group_username_col', :with => '1')
  fill_in('group_id_col', :with => '2')
  fill_in('group_preference_1', :with => '4')
  fill_in('group_preference_2', :with => '5')
  fill_in('group_preference_3', :with => '6')
  fill_in('group_preference_4', :with => '7')
  fill_in('group_preference_5', :with => '8')
  fill_in('group_preference_6', :with => '9')
  fill_in('group_preference_7', :with => '10')
  fill_in('project_tab', :with => 'Projects')
  fill_in('project_id_col', :with => '0')
  fill_in('project_name_col', :with => '1')
  fill_in('matches_tab', :with => 'Current_Match')
  click_button('fetch_matches')
end

And(/^I cannot see a (.*) button$/) do |name|
  expect(page).not_to have_button(name)
end

Then(/^high priority projects are marked so in the database$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^non high priority projects are not marked as high priority in the database$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^group enlisted projects are marked so in the database$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see google sheet instructions$/) do
  page.should_not have_content('From this page you can pull group and project from the currently loaded google sheet')
end


And(/^I should see the authorization page$/) do
  page.should have_content("Looks like you aren't authorized to use the Google Sheets API")
  expect(page).to have_css('input[type="text"]')
end