Box::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
