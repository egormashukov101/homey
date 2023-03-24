Rails.application.routes.draw do
  resources :projects, except: %w[destroy] do
    resources :comments, only: %w[create]
  end

  devise_for :users

  root to: 'projects#index', via: :get
end
