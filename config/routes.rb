Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  post 'users/confirm' => 'users#confirm'

  resources :topics do
     resources :sponsored_posts, except: [:index]

  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :questions

  resources :advertisements
  
  resources :topics do
    resources :posts, except: [:index]
  end
  

  get 'about' => 'welcome#about'
  
  get "welcome/faq" => 'welcome#faq'
  get "users/:id/edit" => 'users#edit'
  
  root to: 'welcome#index'
  
end
