Rails.application.routes.draw do
  get 'documentation', to: 'documentation#index', as: :documentation

  resources :examples, only: :index do
    collection do
      post :create_basic
      post :create_horizontal
      post :create_inline
    end
  end

  root to: 'examples#index'
end
