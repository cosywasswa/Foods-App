require 'rails_helper'

RSpec.describe 'recipe#index', type: :feature do
before(:each) do

    @user1 = User.create(
        id: 3,
        name: "cosmas",
        email: "1@gmail.com",
        password: 'Cosy1234',
        confirmed_at: Time.now
    )

    sign_in @user1

@recipes = [
    recipe1 = Recipe.create(
        id: 1,
        user_id: @user1.id,
        name: "samusa",
        preparation_time: 1,
        cooking_time: 3,
       description: "good",
       public: true
    ),
    recipe2 = Recipe.create(
        id: 2,
        user_id: @user1.id,
        name: "greens",
        preparation_time: 2,
        cooking_time: 1,
       description: "good one",
       public: true
    )
]


visit user_recipes_url(user_id: @user1.id)
end
describe '#Indexpage' do
    it 'can see the recipe name.' do
@recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
end

it 'can see the recipe description.' do
    @recipes.each do |recipe|
          expect(page).to have_content(recipe.description)
        end
    end

    it 'can see the recipe delete button' do
        @recipes.each do |recipe|
              expect(page).to have_button("Delete")
            end
        end
end

describe 'GET show/page' do
    it 'When I click recipe name, I am redirected to that detailed page.' do
        recipe = @recipes.first
      click_link(recipe.name)
      expect(page).to have_current_path(user_recipe_path(id: recipe.id, user_id: recipe.user.id))
    end
  end
end