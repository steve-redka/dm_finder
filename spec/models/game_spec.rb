require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryBot.create(:game) }

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
