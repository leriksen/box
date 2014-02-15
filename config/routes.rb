Box::Application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
