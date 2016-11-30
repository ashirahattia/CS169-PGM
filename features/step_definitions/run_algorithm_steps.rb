Given(/^I am logged in as a TA$/) do
  visit("/login")
  fill_in "password", :with=>"TA"
  click_button("submit")
end

Given(/^there is no existing project\-group match$/) do
    Match.exists?.should be_false
end

Given(/^I have pressed the (.*) button$/) do |name|
  click_button(name)
end

Then(/^I should see a project\-group match table$/) do
    Match.exists?.should be_true
end

Given(/^I (.*) see a (.*) table$/) do |condition, name|
  if condition == 'cannot'
    page.should_not have_css("table##{name} tr")
  else
    page.should have_css("table##{name} tr")
  end
end

Then(/^I should see (.*) button$/) do |name|
  find_button(name).should_not be_nil
end

Then(/^I press (.*) button$/) do |name|
  click_button(name)
end



Then(/^I should see information about the algorithm$/) do
  page.should have_content('Loss Function:')
end

Then(/^I should see three options for cost values$/) do
  find_field('power').should_not be_nil
  find_field('exponential').should_not be_nil
  find_field('x').should_not be_nil
end

Then(/^I should see form fields$/) do
  expect(page).to have_css('input[type="text"]')
end

Given(/^I click the linear cost value button$/) do
  find_field('power').click
end

Then(/^I should see rank (\d+) form field default as (\d+)$/) do |rank, default|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click the exponential cost value button$/) do
  find_field('exponential').click
end

Given(/^I press the Match button again$/) do
  page.click_link("Re-match")
end

Then(/^I should see a warning$/) do 
  page.should have_css("#rematch-confirm-modal")
end

Then(/^I can see a utility number$/) do
  page.should have_css("#utility-number")
end

Given(/^a best match is possible in the data$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^that utility number is (\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^the best match matches groups with all unranked projects$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^high priority projects should not be in the unmatched projects$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^there are unmatched high priority projects$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a warning message that these projects could not be matched$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that group enlisted projects are matched with their groups$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I can see all unmatched projects$/) do
  page.should have_css("table#unmatched_projects_table")
end