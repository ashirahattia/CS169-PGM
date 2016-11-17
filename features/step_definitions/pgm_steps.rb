require "././spec/spec_helper"

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
  check("delete_1")
end

Then(/^Group should not have the first group$/) do
  page.should_not have_content("delete[1]")
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
  response = dummy_project_data_values
  response.each do |row|
    Project.create(:id => row[0], :project_name => row[1])
  end
  response_groups = dummy_group_data_values
  GoogleController.create_groups(response_groups)
end