Rails.application.routes.draw do
  # Root
  authenticated :user do
    root to: "home#index", :as => :authenticated_root
  end
  unauthenticated do
    root to: "landing_page#index"
  end
  # Home Page routes
  get "home" => "home#index"
  get "explore" => "home#explore"
  get "tracks" => "home#tracks"
  get "posts" => "home#posts"
  get "cliques" => "home#cliques"
  # Settings routes
  get 'settings' => 'settings#account_settings'
  get 'change_password' => 'settings#change_password'
  get 'clique_settings' => 'settings#clique_settings'
  get 'edit_profile' => 'settings#edit_profile'
  get 'orders' => 'settings#orders'
  get 'payment_settings' => 'settings#payment_settings'
  get 'edit_clique' => 'settings#edit_clique'
  get 'clique_members' => 'settings#clique_members'
  get 'clique_orders' => 'settings#clique_orders'
  # Resources
  resources :users, :only => [:index, :show, :update], :path => 'profile' do
    post 'follow'
    post 'unfollow'
    patch 'update_password'
    get 'all'
    get 'posts'
    get 'reposts'
    get 'clique'
    get 'songs'
    get 'followers'
    get 'following'
  end
  resources :tracks, :only => [:new, :create, :destroy]
  resources :posts, :only => [:create, :update] do
    post 'delete'
  end
  resources :cliqs, :only => [:create, :update], :path => 'clique' do
    post 'join'
    post 'leave'
  end
  # Auth
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "registrations", :confirmations => "confirmations", :passwords => "passwords"}
  devise_scope :user do
    resources :passwords, :only => [:new, :create, :edit, :update]
  end
end
