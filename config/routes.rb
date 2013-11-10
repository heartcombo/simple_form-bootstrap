SimpleFormBootstrap::Application.routes.draw do
  resources :articles do
    resources :comments, :only => :create, :controller => 'articles/comments'
  end

  resources :examples

  root :to => 'articles#index'
end
