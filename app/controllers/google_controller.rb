require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

class GoogleController < ApplicationController
  include MatchesHelper
  include ApplicationHelper
  include GoogleHelper

  before_filter :check_logged_in

  @@SETTINGS = Setting.first

  def projects_groups_fetch
    if check_authorization
      if fetch_project_data
        fetch_group_data
      end
    end
  end

  def write_matches
    if check_authorization
      write_all_matches
    end
  end

  def fetch_matches
    if check_authorization
      update_matches_sheet
    end
  end

  def save_preferences
    if check_authorization
      update_settings
      @@SETTINGS = Setting.first
      redirect_to google_fetch_path
    end
  end

  def index
  end

  def settings
  end

  #### CS169-PGM GOOGLE METHODS BEGIN ####

  def fetch_project_data
    response = fetch_data(@@SETTINGS.project_tab)
    unless response.nil?
      adjust_projects response
      return true
    end
    false
  end

  def adjust_projects(response)
    Project.destroy_all
    delete_matches(response)
    create_projects(response)
  end

  def create_projects(response)
    response.values.each do |row|
      if row[@@SETTINGS.project_id_col.to_i].nil?
        return
      end
      Project.create(:id => row[@@SETTINGS.project_id_col.to_i],
                     :project_name => row[@@SETTINGS.project_name_col.to_i])
    end
  end

  #Fetches the data from the google sheet
  def fetch_group_data
    response = fetch_data(@@SETTINGS.group_tab)
    unless response.nil?
      adjust_groups response
    end
  end

  # Takes the google sheet response and generates all the groups from it
  def adjust_groups(response)
    Group.destroy_all
    delete_matches(response)
    create_groups(response)
    redirect_to root_path
  end

  def create_groups(response)
    response.values.each do |row|
      if row[@@SETTINGS.group_id_col.to_i].nil?
        return
      end
      preferences = []
      preference_rows = row
      preference_rows.each do |preference|
        id = (/\d+/.match(preference))
        if !id.nil?
          preferences.push(id[0])
        else
          preferences.push([])
        end
      end
      Group.create(:id => row[@@SETTINGS.group_id_col.to_i], :username => row[@@SETTINGS.group_username_col.to_i],
                   :first_choice => preferences[@@SETTINGS.group_preference_1.to_i],
                   :second_choice => preferences[@@SETTINGS.group_preference_2.to_i],
                   :third_choice => preferences[@@SETTINGS.group_preference_3.to_i],
                   :fourth_choice => preferences[@@SETTINGS.group_preference_4.to_i],
                   :fifth_choice => preferences[@@SETTINGS.group_preference_5.to_i],
                   :sixth_choice => preferences[@@SETTINGS.group_preference_6.to_i],
                   :seventh_choice => preferences[@@SETTINGS.group_preference_7.to_i])
    end
  end

  def update_matches_sheet
    response = fetch_data(@@SETTINGS.matches_tab)
    unless response.nil?
      response = delete_matches(response)
      response.values.each do |row|
        if row[0] != 'None'
          Match.create(:group_id => row[0], :project_id => row[1])
        end
      end
      flash[:notice] = 'Matches Fetched and '
      write_all_matches
    end
  end

  def write_all_matches
    temp_matches = Match.all.sort_by { |some_match| (some_match.group.id.to_i) }
    match_values = [['Group ID', 'Project ID', 'Project Name']]
    temp_matches.each do |match|
      match_values.push([match.group.id, match.project.id, match.project.project_name])
    end
    find_unmatched_projects.each do |project|
      match_values.push(['None', project.id, project.project_name])
    end
    begin
      service_authorize.clear_values(@@SETTINGS.spreadsheet_id, @@SETTINGS.matches_tab)
      values = Google::Apis::SheetsV4::ValueRange.new({:values => match_values, :major_dimension => 'ROWS'})
      service_authorize.update_spreadsheet_value(@@SETTINGS.spreadsheet_id, @@SETTINGS.matches_tab, values,
                                                 value_input_option:'USER_ENTERED')
      if flash[:notice]
        flash[:notice] += 'Matches Re-Alphabetized and Written.'
      else
        flash[:notice] = 'Matches Written.'
      end
      redirect_to google_fetch_path
    rescue Signet::AuthorizationError
      authorize true
      return
    rescue Google::Apis::AuthorizationError
      authorize true
      return
    end
  end

  #### GOOGLE METHODS BEGIN ####

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'CS169'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "sheets.googleapis.com-ruby-quickstart.yaml")
  SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS

  def complete_authorization
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
    user_id = 'default'

    begin
      authorizer.get_and_store_credentials_from_code(user_id: user_id, code: params[:code], base_url: OOB_URI)
      session[:is_authorized] = true
    rescue Signet::AuthorizationError
      flash[:notice] = 'Error, invalid code. Try again'
    end

    redirect_to google_fetch_path
  end

  def check_authorization
    if authorize(false)
      return true
    else
      return false
    end
  end

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize(force_reload)
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if force_reload || credentials.nil?
      session[:is_authorized] = false
      redirect_to google_fetch_path
      return
    end
    credentials
  end

  def service_authorize
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize false
    service
  end

  def fetch_data(range)
    begin
      response = service_authorize.get_spreadsheet_values(@@SETTINGS.spreadsheet_id, range)
    rescue Signet::AuthorizationError
      authorize true
      return
    rescue Google::Apis::AuthorizationError
      authorize true
      return
    rescue Google::Apis::ClientError
      flash[:notice] = "Error fetching: #{range} in spreadsheet id: #{@@SETTINGS.spreadsheet_id}"
      redirect_to google_fetch_path
      return
    end
    response
  end

end