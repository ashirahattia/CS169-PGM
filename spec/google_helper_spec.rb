require "spec_helper"

describe GoogleHelper, :type => :helper do
    it 'updates settings' do
        helper.update_settings
        expect(flash[:notice]).to match('Settings Updated')
    end
    
    it 'returns current sheet link' do
        fake_settings = Setting.new(:spreadsheet_id => 1)
        Setting.should_receive(:first).and_return(fake_settings)
        expect(helper.current_google_link).to match('https://docs.google.com/spreadsheets/d/1/')
    end
end