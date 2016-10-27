Then(/^a (.*) project should exist$/) do |name|
    Project.where(project_name: name).should_not be_nil
end