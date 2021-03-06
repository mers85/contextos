Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :categories
  resources :contexts do
    resources :information_posts
    resources :pictures
    resource :favourite, only: %w(update destroy), module: 'contexts'
    resource :redaction, only: %w(edit), module: 'contexts', controller: 'redaction'
    collection do
      get 'redaction', controller: 'contexts/redaction', action: 'index'
    end
  end
  resources :webscraping, only: %w(index), module: 'contexts'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
