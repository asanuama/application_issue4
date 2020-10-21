Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show,:index,:edit,:update] do
    # 親であるuserのidが欲しいため、usersの中にネスト
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: 'followings'
    get "followers" => "relationships#followers", as: 'followers' 
    
  end 
    
   get '/search' => 'search#search', as: 'search'
 # get '/users_index' => 'search#users_index',as: 'Users_index_path'
  
end
