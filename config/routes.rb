Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :categories
  resources :contexts do
    resources :information_posts
    resources :pictures
    resource :favourite, only: %w(update destroy), module: 'contexts'
    resource :redaction, only: %w(edit update), module: 'contexts', controller: 'redaction'
  end
  resources :webscraping, only: %w(index), module: 'contexts'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
