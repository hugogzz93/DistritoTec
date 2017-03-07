Rails.application.routes.draw do
  root to: "home#index"
  delete '/sign_out', to: 'sessions#log_out', as: 'sign_out'
  
  resources :events, :event_info, :event_dates
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' }
end
