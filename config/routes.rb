Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "search" => "searches#search"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  
  end  
  resources :animals do
   resources :animal_comments, only: [:create, :destroy,]
   resource :favorites, only: [:create, :destroy]
  end


end
