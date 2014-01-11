Box::Application.routes.draw do
  devise_for :users
  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
