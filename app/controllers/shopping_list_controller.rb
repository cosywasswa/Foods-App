class ShoppingListController < ApplicationController
  def index
    @recipe_foods = current_user.recipe_foods.group(:food_id).sum(:quantity)
    @foods = current_user.foods
  end

  def show; end
end
