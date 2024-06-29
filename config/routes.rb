Rails.application.routes.draw do
  resources :real_estates
  root 'loans#home', as: 'loans_home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
