Rails.application.routes.draw do
  root to: "home#index"
  delete '/sign_out', to: 'sessions#log_out', as: 'sign_out'

  resources :events do 
  	resources :event_dates, :event_info, :registrations
  end
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' }
end
