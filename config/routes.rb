Rails.application.routes.draw do
  resources :state_transactions, only: :index do
  	post :import, on: :collection
  end

  root 'state_transactions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
