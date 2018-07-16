Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'submissions/index'
  get 'submissions/show'
  get 'submissions/new'
  get 'threads/new'
  get 'threads/index'
  get 'threads/show'
  devise_for :users


  resources :submissions do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  root 'submissions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
