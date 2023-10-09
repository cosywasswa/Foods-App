Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy]
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :recipe_foods, except: %i[edit update]
    resources :public_recipes, only: [:index]
    resources :shopping_list, only: [:index, :show]
  end
end
