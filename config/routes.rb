Rails.application.routes.draw do
  root to: "home#index"
  delete '/sign_out', to: 'sessions#log_out', as: 'sign_out'

  post '/event_registrations/:event_id', to: 'event_registrations#register',
                                       as: 'register_user'
  # get '/hello/:user_id', to: 'event_registration#register', as: 'register_user'

  resources :events do 
  	resources :event_info
  	resources :event_dates do 
  		# resources :event_registrations, only: [:index]
  	end
  end
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_for :users, controllers: { registrations: 'registrations' }
end
