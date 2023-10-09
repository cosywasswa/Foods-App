Rails.application.routes.draw do
  get 'shopping_list/index'
  get 'shopping_list/show'
  get 'foods/index'
  get 'foods/show'
  get 'foods/new'
  get 'foods/create'
  get 'foods/destroy'
  get 'public_recipes/index'
  get 'public_recipes/show'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/modify'
  get 'recipe_foods/destroy'
  get 'recipe/index'
  get 'recipe/show'
  get 'recipe/new'
  get 'recipe/create'
  get 'recipe/destroy'
  get 'users/index'
  get 'users/show'
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy]
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :recipe_foods, except: %i[edit update]
    resources :public_recipes, only: [:index]
    resources :shopping_list, only: [:index, :show]
  end
end
