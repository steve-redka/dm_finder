require 'rails_helper'

RSpec.describe "Games", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:game) { FactoryBot.create(:game, dm: user) }

  before do
    sign_in user  # Devise helper (make sure you've included Devise test helpers)
  end

  describe "DELETE /games/:id" do
    it "deletes the game" do
      expect {
        delete game_path(game)
      }.to change(Game, :count).by(-1)

      expect(response).to redirect_to(games_path)
      follow_redirect!
      expect(response.body).to include("successfully deleted").or include("Game")
    end
  end
end