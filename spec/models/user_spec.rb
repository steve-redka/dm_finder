require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'name' do
    it 'is valid with a name' do
      user.name = 'John Doe'
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end

  describe 'avatar' do
    it 'responds to avatar' do
      expect(user).to respond_to(:avatar)
    end
  end
end
