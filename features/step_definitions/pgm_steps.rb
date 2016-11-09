Then(/^a (.*) project should exist$/) do |name|
    Project.where(project_name: name).should_not be_nil
end

And(/^all Groups should have preferences$/) do
  pending
end

Then(/^Group should not be empty$/) do
  pending
end

Then(/^I should see a(.*)? algorithm score$/) do
  pending
end

And(/^I input the group information$/) do
  pending
end

And(/^I set the group preferences \# This line probably needs to be expanded\?$/) do
  pending
end

Then(/^the new group should exist with my preferences set$/) do
  pending
end

And(/^I should see a warning label$/) do
  pending
end

Then(/^I select the first group$/) do
  pending
end

Then(/^Group should not have the first group$/) do
  pending
end

Then(/^I login to Google$/) do
  pending
end

And(/^I input the project information$/) do
  pending
end