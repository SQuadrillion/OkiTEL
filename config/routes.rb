Rails.application.routes.draw do

  root 'toppage#index'
  
  get 'twilio/callback'
  
  namespace 'api' do
    get 'call/registers'
    get 'call/remain_times'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :registers 
end
