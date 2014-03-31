SimpleFormBootstrap::Application.routes.draw do
  resources :examples, only: :index

  root to: 'examples#index'
end
