describe MatchesController, :type => :controller do
  
  it 'new matching' do
    session[:is_ta] = true
    params = {:loss_function => "power", :x => "1"}
    get :new
    expect(response).to redirect_to '/matches'
    
    params = {:loss_function => "exponential", :x => "1"}
    get :new
    expect(response).to redirect_to '/matches'
    
  end
 
end