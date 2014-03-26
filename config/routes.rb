Box::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
