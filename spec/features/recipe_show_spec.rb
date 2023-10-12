require 'rails_helper'

RSpec.describe 'recipe#show', type: :feature do
before(:each) do

    @user1 = User.create(
        id: 3,
        name: "Cosmas",
        email: "1@gmail.com",
        password: 'Cosy12345',
        confirmed_at: Time.now
    )

    sign_in @user1

    @recipe1 = Recipe.create(
        id: 1,
        user_id: @user1.id,
        name: "samusa",
        preparation_time: 1,
        cooking_time: 3,
       description: "good",
       public: true
    )

visit user_recipe_url(id: @recipe1.id, user_id: @recipe1.user.id)
end
describe '#Indexpage' do
    it 'can see the recipe preparation_time.' do
      expect(page).to have_content(@recipe1.preparation_time)
   
end

it 'can see the recipe description.' do
          expect(page).to have_content(@recipe1.cooking_time)
    end

    it 'can see the recipe description.' do
        expect(page).to have_content('Public')
  end

  it 'displays the "Generate Shopping List" link' do
    expect(page).to have_link('Generate Shopping List', href: user_shopping_list_index_path(@recipe1.user, @recipe1))
  end
  it 'does not displays the "Add Ingredient" link' do
    expect(page).not_to have_link('Add Ingredient', href: new_user_recipe_food_path(recipe1_id: @recipe1.id, user_id: @recipe1.user.id))
  end
end
end