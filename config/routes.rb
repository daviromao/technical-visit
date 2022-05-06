Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :formularies
      resources :questions
      resources :visits
      resources :answers

      get '/visits/me', to: 'answers#my_visits'
      post '/auth/login', to: 'authentication#login'
    end
  end

  get '/*a', to: 'application#not_found'
end
