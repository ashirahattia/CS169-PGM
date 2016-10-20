Given(/^I am logged in as a TA$/) do
end

Given(/^there is no existing project\-group match$/) do
  assert Matches.exists? == false
end

Given(/^I have pressed the (.*) button$/) do |name|
  click_button(name)
end

Then(/^I should see a project\-group match table$/) do
  assert Matches.exists? == true
end

Given(/^I can see a table$/) do
  page.should have_css("table#match_table tr")
end

Then(/^I should see (.*) button$/) do |name|
  find_button(name).should_not be_nil
end

Then(/^I press (.*) button$/) do |name|
  click_button(name)
end

Then(/^I should see a different table$/) do
  page.should have_css("table#match_table tr")
end
