Box::Application.routes.draw do
  root "pages#index"

  get 'pages/:id' => 'pages#show'
end
