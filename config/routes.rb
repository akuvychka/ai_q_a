Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'main#show', as: :root

  resources :posts do
    get :follow, on: :member
    get :unfollow, on: :member
  end

  resources :comment, only: [:create] do
    get :rate_up, on: :member
    get :rate_down, on: :member
  end
end
