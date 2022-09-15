Rails.application.routes.draw do
  devise_for :users

  unauthenticated :users do
    root "users#home"
  end

  authenticated :users do
    root 'groups#index', as: ''
  end

  resources :groups, only: [:index]

  resources :users do
    resources :groups, only: [:index, :show, :new, :create, :destroy] do
      resources :entities, only: [:index, :new, :create, :destroy]
    end
  end
end
