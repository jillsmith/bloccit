Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :topics do
     resources :sponsored_posts, except: [:index]
  end

  resources :questions

  resources :advertisements
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  
end
