Rails.application.routes.draw do
  
  root 'state_transactions#index'
  
  resources :state_transactions, only: :index do
  	post :import, on: :collection
  end

  namespace :api, defaults: { format: :json } do
  	namespace :v1 do
  		resources :state_transactions, except: [:new, :edit, :show]
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
