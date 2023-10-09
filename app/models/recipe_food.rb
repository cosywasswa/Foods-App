class RecipeFood < ApplicationRecord
    belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id'
    belongs_to :food, class_name: 'Food', foreign_key: 'food_id'
    has_many :recipe_foods
  
    validates :food, :quantity, presence: true
  end