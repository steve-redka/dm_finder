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

  describe "Search /games/", type: :request do  
    let!(:game2) { FactoryBot.create(:game, title: "Beginner DnD", description: "Great for new players", age_restriction: "any", dm: user) }
    let(:wod) { GamingSystem.find_by(name: "World of Darkness") }
    let!(:game3) { FactoryBot.create(:game, title: "Dark streets", description: "Horror game about vampires", age_restriction: "18+", dm: user, gaming_system: wod) }
  
    describe "GET /games?q[title_or_description_cont]=..." do
      it "returns matching games by title" do
        get games_path, params: { q: { title_or_description_cont: "DnD" } }
        expect(response.body).to include("Beginner DnD")
        expect(response.body).not_to include("Dark streets")
      end
    end
  
    describe "GET /games?q[age_restriction]=..." do
      it "filters by age rating" do
        get games_path, params: { q: { age_restriction_eq: "18+" } }
        expect(response.body).to include("Dark streets")
        expect(response.body).not_to include("Beginner DnD")
      end
    end
  
    describe "GET /games?q[gaming_system_name_cont]=..." do
      it "filters by gaming system name" do
        get games_path, params: { q: { gaming_system_name_cont: "World of Darkness" } }
        expect(response.body).to include("Dark streets")
        expect(response.body).not_to include("Beginner DnD")
      end
    end
  end
end