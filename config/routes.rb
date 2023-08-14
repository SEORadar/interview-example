Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "public#homepage", as: :homepage

  scope '', format: false do
    get '/logout', to: 'signin#logout', as: :logout
    scope '/signin' do
      get '', to: 'signin#signin', as: :signin
      post '', to: 'signin#signin_submit', as: :signin_submit
    end

    scope 'shop' do
      scope '/:category_slug' do
        get '', to: 'shop#category', as: :category
        scope '/:product_slug' do
          get '', to: 'shop#product', as: :product
        end
      end
    end

    scope 'members' do
      get '', to: 'members#dashboard', as: :members_dashboard
    end
  end

end
