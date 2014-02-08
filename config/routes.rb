Box::Application.routes.draw do
  get "registrations/new"
  get "registrations/create"
  devise_for :users, controllers: {registrations: 'registrations'}

  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
