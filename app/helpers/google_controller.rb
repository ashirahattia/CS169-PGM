require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'

class GoogleController < ApplicationController

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  APPLICATION_NAME = 'CS169'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "sheets.googleapis.com-ruby-quickstart.yaml")
  SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS
  SPREADSHEET_ID = '1kPwI0T6PnmVT9TF7QqDa1TWsKlnNRG2sXGBsnhWv7AI'

  def show
  end

  def groups_fetch
    fetch_group_data
  end

  def projects_fetch
    fetch_project_data
  end

  def index
  end

  def get_authorization
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    session[:authorize] = url
  end

  def complete_authorization
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, SCOPE, token_store)
    user_id = 'default'

    begin
      authorizer.get_and_store_credentials_from_code(user_id: user_id, code:params[:code], base_url: OOB_URI)
    rescue Signet::AuthorizationError
      flash[:notice] = "Error, invalid code. Try again"
      return
    end

    redirect_to google_fetch_path
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
    if credentials.nil? || force_reload
      redirect_to google_authorize_path
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

  #Fetches the data from the google sheet
  def fetch_group_data
    begin
      response = service_authorize.get_spreadsheet_values(SPREADSHEET_ID, 'Responses!A1:K29')
    rescue Signet::AuthorizationError
      authorize true
    rescue Google::Apis::AuthorizationError
      authorize true
    end
    unless response.nil?
      adjust_groups response
    end
  end

  # Takes the google sheet response and generates all the groups from it
  def adjust_groups response
    Group.destroy_all
    Match.destroy_all
    response.values = response.values.drop(1)
    response.values.each do |row|
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
    redirect_to google_show_groups_path
  end

  def fetch_project_data
    begin
      response = service_authorize.get_spreadsheet_values(SPREADSHEET_ID, 'Projects!A1:B50')
    rescue Signet::AuthorizationError
      authorize true
    rescue Google::Apis::AuthorizationError
      authorize true
    end
    unless response.nil?
      adjust_projects response
    end
  end

  def adjust_projects(response)
    Project.destroy_all
    Match.destroy_all
    response.values = response.values.drop(1)
    response.values.each do |row|
      Project.create(:id => row[0], :project_name => row[1])
    end
    redirect_to google_show_projects_path
  end

end