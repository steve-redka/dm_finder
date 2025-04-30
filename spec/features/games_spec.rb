require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.feature 'Games', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario 'User creates a game' do 
    pending
    visit new_game_path

    fill_in 'Title', with: 'Test Game'
    fill_in 'Description', with: 'This is a test game.'
    click_button 'Create Game'

    expect(page).to have_content('Game was successfully created.')
    expect(page).to have_content('Test Game')
    expect(page).to have_content('This is a test game.')
  end
end