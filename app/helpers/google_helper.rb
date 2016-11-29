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
    flash[:notice] = 'Settings Updated.'
  end

  def current_parameters
    {:spreadsheet_id => SPREADSHEET_ID}
  end

  def current_google_link
    "https://docs.google.com/spreadsheets/d/#{SPREADSHEET_ID}/"
  end

end
