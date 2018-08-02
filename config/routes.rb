Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :categories
  resources :contexts do
    resources :information_posts
    member do
      put 'add_to_favourites'
    end
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
