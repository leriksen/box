Box::Application.routes.draw do
  get "registrations/new"
  get "registrations/create"
  devise_for :users

  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
