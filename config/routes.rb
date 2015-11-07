Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  post 'users/confirm' => 'users#confirm'

  resources :topics do
     resources :sponsored_posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :questions

  resources :advertisements
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'
  
  get "welcome/faq" => 'welcome#faq'
  get "users/:id/edit" => 'users#edit'
  
  root to: 'welcome#index'
  
end
