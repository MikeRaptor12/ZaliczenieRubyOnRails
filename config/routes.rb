Rails.application.routes.draw do
  resources :events do
    # Dodatkowe akcje związane z wydarzeniami
    member do
      get 'assign_users'
      patch 'assign_users'
    end
  end

  resources :users
  resources :performers
  resources :movies

  root 'events#index' # Strona główna
end
