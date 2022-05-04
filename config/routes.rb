Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :formularies
      resources :questions
      post '/auth/login', to: 'authentication#login'
    end
  end

  get '/*a', to: 'application#not_found'
end
