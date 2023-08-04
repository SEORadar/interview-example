Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "public#homepage", as: :homepage

  scope '', format: false do
    get '/logout', to: 'auth#logout', as: :logout
    post '/auth/user', to: 'auth#auth_user', as: :auth_user

    scope 'members' do
      get '', to: 'members#dashboard', as: :members_dashboard
    end
  end

end
