Rails.application.routes.draw do
  # ユーザー側
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }

  resources :users, only: [:show, :create, :update, :destroy]
  
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :create, :update, :destroy] do
      resources :comments, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # ホームページとAboutページ
  root 'home#index'
  get 'about', to: 'home#about'

  # 管理者側
  namespace :admin do
    devise_for :admins, path: 'admin', controllers: {
      sessions: 'admin/sessions'
    }

    resources :users, except: [:new, :edit]
    resources :movies, except: [:new, :edit]
    resources :reviews, except: [:new, :edit]
    resources :comments, except: [:new, :edit]
    resources :tags, except: [:new, :edit]
    resources :movie_tags, only: [:index, :create, :destroy]

    # 管理者用のトップページ
    get 'top', to: 'home#top'
  end
end