Rails.application.routes.draw do
  root 'home#index'

  get 'about', to: 'home#about'



  devise_for :users, controllers: {
    registrations: 'public/registrations'
  }

  # 管理者側のDeviseルーティング
  devise_for :admin, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }, path_names: {
    sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in'
  }

  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 映画とその関連リソースのルーティング
  scope module: :public do
    resources :movies, only: [:index, :show] do
      resources :reviews, only: [:index, :show, :create, :update, :destroy] do
        resources :comments, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  # レビューのルーティング
  scope module: :public do
    resources :reviews, only: [:index, :show, :create, :update, :destroy]


  end

  namespace :admin do
  resources :users, only: [:index, :show, :destroy] do
    resources :reviews, only: [:index, :destroy]
    resources :comments, only: [:destroy]
  end
end

  namespace :admin do
    get "/", to: 'admins#index'
    #get 'login', to: 'sessions#new', as: 'login'
    #post 'login', to: 'sessions#create', as: 'create_session'
    delete 'logout', to: 'sessions#destroy', as: 'logout'
    root to: 'admin/homes#top'
    resources :users, except: [:new, :edit]
    resources :movies
    resources :reviews, except: [:new, :edit]
    resources :comments, except: [:new, :edit]
    # resources :tags, except: [:new, :edit]
    # resources :movie_tags, only: [:index, :create, :destroy]
    get 'top', to: 'homes#top'
  end

  # namespace :admin do
  #   get 'login', to: 'sessions#new', as: 'login'
  #   post 'login', to: 'sessions#create', as: 'create_session'
  #   delete 'logout', to: 'sessions#destroy', as: 'logout'
  #   root to: 'admin/homes#top'
  #   resources :users, except: [:new, :edit]
  #   resources :movies, except: [:new, :edit]
  #   resources :reviews, except: [:new, :edit]
  #   resources :comments, except: [:new, :edit]
  #   resources :tags, except: [:new, :edit]
  #   resources :movie_tags, only: [:index, :create, :destroy]
  #   get 'top', to: 'homes#top'
  # end

  namespace :public do
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :movies, only: [:index, :show] do
      resources :comments, only: [:create, :destroy]
    end
  end

  get 'search', to: 'search#search'  # 検索機能のルート
  get 'search', to: 'search#results'
  resources :genres, only: [:show]
  resources :movies, only: [:index, :show]
end