Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :people
  resources :events
  resources :places
  resources :custom_fields
  resources :links

  root to: 'home#index' # 必要に応じてホームコントローラーを設定
end
