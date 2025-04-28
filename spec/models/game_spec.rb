require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryBot.create(:game) }

  describe 'associations' do
    it { should belong_to(:dm).class_name('User').optional }
    it { should have_and_belong_to_many(:users).join_table('games_users') }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(game).to be_valid
    end

    it 'is not valid without a title' do
      game.title = nil
      expect(game).not_to be_valid
    end
  end
end
