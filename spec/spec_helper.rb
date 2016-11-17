require "simplecov"
SimpleCov.start do
  add_filter "/bin/"
  add_filter "/config/"
  add_filter "/coverage/"
  add_filter "/db/"
  add_filter "/features/"
  add_filter "/iterations/"
  add_filter "/lib/"
  add_filter "/log/"
  add_filter "/public/"
  add_filter "/spec/"
  add_filter "/tmp/"
  add_filter "/vendor/"
  add_filter "/config.ru"
  add_filter "/Gemfile"
  add_filter "/Gemfile.lock"
  add_filter "/LICENSE"
  add_filter "/Rakefile"
  add_filter "/README.md"
  add_filter "/README.rdoc"
  add_filter "/app/assets/"
  add_filter "/app/models/match.rb" #TEMPORARILY filtered because it's a dummy file right now
end
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def session
  last_request.env['rack.session']
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
  [["9/15/2016 10:57:54", "jsullivan27@berkeley.edu", "2",
    "11 CommunityGrows", "11 CommunityGrows", "3 Orinda Police Department",
    "5 AsylumConnect", "9 CITY DOG SHARE (Calendar App)",
    "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
    "13 Effective Altruists of Berkeley", "21 ORAM"],
   ["9/20/2016 21:31:53", "aditya2013@berkeley.edu",
    "3", "19 The Arctic Institute",
    "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
    "10 CITY DOG SHARE (Dog Profile App)", "13 The Arctic Institute",
    "20 San Francisco Bay Bird observatory",
    "12 UC Berkeley: Educational Technology Services",
    "21 Orinda Police Department",
    "12 UC Berkeley - EECS Department - CS 169 (Project-Group Matching)"],
   ["9/20/2016 15:48:34",
    "junyuw@berkeley.edu",
    "4",
    "14 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
    "10 CITY DOG SHARE (Dog Profile App)",
    "12 UC Berkeley - EECS Department - CS 169 (ProjectScope)",
    "9 CITY DOG SHARE (Calendar App)",
    "9 UC Berkeley Family Student Housing",
    "4 Armando Fox - Altarena Playhouse & Custom Made Theater Co. (Directable)",
    "11 CommunityGrows",
    "7 UC Berkeley: Educational Technology Services"]]
end

def dummy_group_with_headers
  [["Timestamp", "Email Address", "What is your team ID?",
    "Assigned", "1st preference:", "2nd preference:",
    "3rd preference:", "4th preference:", "5th preference:",
    "6th preference", "7th preference"]]
end
