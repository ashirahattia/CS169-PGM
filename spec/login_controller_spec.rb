require "spec_helper"

describe LoginController, :type => :controller do
    it 'checks if user is currently logged in' do
       session = {:is_ta => true}
       controller.index
       expect(session[:is_ta]).to be_true
    end
    
    it 'logs the user out' do
        controller.should_receive(:redirect_to).with(:login).and_return(true)
        controller.logout
        expect(session[:is_ta]).to be_false
    end
    
    it 'logs in with the correct password' do
        controller.params = {:password=>"TA"}
        controller.should_receive(:redirect_to).with('/matches/show').and_return(true)
        controller.attempt
        expect(session[:is_ta]).to be_true
    end
    
    it 'fails with the incorrect password' do
        controller.params = {:password=>"not_TA"}
        controller.should_receive(:redirect_to).with(:login).and_return(true)
        controller.attempt
        expect(session[:is_ta]).to be_false
    end
end