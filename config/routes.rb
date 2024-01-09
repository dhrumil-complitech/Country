Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/states/:country_id/fetch_states', to: 'states#fetch_states'
  # Defines the root path route ("/")
  # root "posts#index"
  root "countries#index"
  resources :states 
  resources :cities
  resources :countries do
    collection do
      post 'import_csv'
    end
  end
end
