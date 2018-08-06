Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :categories
  resources :contexts do
    resources :information_posts
    resource :favourite, only: %w(update destroy), module: 'contexts'
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
