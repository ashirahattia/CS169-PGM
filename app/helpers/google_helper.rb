module GoogleHelper

  SPREADSHEET_ID = '1kPwI0T6PnmVT9TF7QqDa1TWsKlnNRG2sXGBsnhWv7AI'

  def check_authorization
    session[:is_authorized]
  end

  def get_authorization
    FileUtils.mkdir_p(File.dirname(File.join(Dir.home, '.credentials',
                                             "sheets.googleapis.com-ruby-quickstart.yaml")))

    client_id = Google::Auth::ClientId.from_file('client_secret.json')
    token_store = Google::Auth::Stores::FileTokenStore.new(file: File.join(Dir.home, '.credentials',
                                                                           "sheets.googleapis.com-ruby-quickstart.yaml"))
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, Google::Apis::SheetsV4::AUTH_SPREADSHEETS, token_store)
    url = authorizer.get_authorization_url(base_url: 'urn:ietf:wg:oauth:2.0:oob')
    session[:is_authorized] = false
    session[:authorize] = url
  end

  def delete_matches(response)
    Match.destroy_all
    response.values = response.values.drop(1)
    response
  end

  def update_settings
    Setting.destroy_all
    Setting.create(:spreadsheet_id => params[:spreadsheet_id],
                   :group_tab => params[:group_tab],
                   :group_username_col => params[:group_username_col],
                   :group_id_col => params[:group_id_col],
                   :group_preference_1 => params[:group_preference_1],
                   :group_preference_2 => params[:group_preference_2],
                   :group_preference_3 => params[:group_preference_3],
                   :group_preference_4 => params[:group_preference_4],
                   :group_preference_5 => params[:group_preference_5],
                   :group_preference_6 => params[:group_preference_6],
                   :group_preference_7 => params[:group_preference_7],
                   :project_tab => params[:project_tab],
                   :project_id_col => params[:project_id_col],
                   :project_name_col => params[:project_name_col],
                   :matches_tab => params[:matches_tab])
    flash[:notice] = 'Settings Updated'
  end

  def current_settings
    settings = Setting.first
    session[:spreadsheet_id] = settings.spreadsheet_id
    session[:group_tab] = settings.group_tab
    session[:group_username_col] = settings.group_username_col
    session[:group_id_col] = settings.group_id_col
    session[:group_preference_1] = settings.group_preference_1
    session[:group_preference_2] = settings.group_preference_2
    session[:group_preference_3] = settings.group_preference_3
    session[:group_preference_4] = settings.group_preference_4
    session[:group_preference_5] = settings.group_preference_5
    session[:group_preference_6] = settings.group_preference_6
    session[:group_preference_7] = settings.group_preference_7
    session[:project_tab] = settings.project_tab
    session[:project_id_col] = settings.project_id_col
    session[:project_name_col] = settings.project_name_col
    session[:matches_tab] = settings.matches_tab
  end

  def current_google_link
    "https://docs.google.com/spreadsheets/d/#{Setting.first.spreadsheet_id}/"
  end

end
