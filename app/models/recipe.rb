class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, class_name: 'RecipeFood'
  belongs_to :recipe

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
