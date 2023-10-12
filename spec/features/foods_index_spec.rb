require 'rails_helper'

RSpec.describe 'food#index', type: :feature do
  before(:each) do
    @user1 = User.create(
      id: 3,
      name: 'cosmas',
      email: '1@gmail.com',
      password: 'Cosy1234',
      confirmed_at: Time.now
    )

    sign_in @user1

    @foods = [
      Food.create(
        id: 1,
        user_id: @user1.id,
        name: 'maonese',
        measurement_unit: 'gramms',
        quantity: 3,
        price: 4
      ),
      Food.create(
        id: 2,
        user_id: @user1.id,
        name: 'samosa',
        measurement_unit: 'gramms',
        quantity: 4,
        price: 2
      )
    ]


    visit user_foods_url(user_id: @user1.id)
  end
  describe '#Indexpage' do
    it 'can see the food name.' do
      @foods.each do |food|
        expect(page).to have_content(food.name)
      end
    end

    it 'can see the measurement_units' do
      @foods.each do |food|
        expect(page).to have_content(food.measurement_unit)
      end
    end

    it 'can see the price' do
      @foods.each do |food|
        expect(page).to have_content(food.price)
      end
    end
  end

  describe 'GET new/page' do
    it 'When I click add food, I am redirected to that form page.' do
      click_link('Add food')
      expect(page).to have_current_path(new_user_food_path(user_id: @user1.id))
    end
  end
end
