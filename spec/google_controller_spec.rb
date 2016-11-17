require "spec_helper"

describe GoogleController, :type => :controller do
  it 'checks for authorization URL' do
    controller.get_authorization
    expect(session[:authorize]).to_not eq(nil)
  end

  it 'checks for completion of authorization' do
    controller.params = {:code => 'Test'}
    controller.complete_authorization
    expect(flash[:notice]).to_not eq(nil)
  end

end