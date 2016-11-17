require "spec_helper"

describe ApplicationHelper, :type => :helper do
    it 'checks if user is logged in' do
        session = {:is_ta => false}
        helper.should_receive(:redirect_to).with(:login)
        helper.check_logged_in
        
    end
end