require 'rails_helper'

RSpec.describe "JoinRequests", type: :request do
    let(:dm) { create(:user) }
    let(:player) { create(:user) }
    let(:game) { create(:game, dm: dm) }
    let(:join_request) { create(:join_request, game: game, user: player, status: 'pending') }

    before { sign_in player }

    describe "POST /games/:game_id/join_requests" do
        it "creates a join request" do
        expect {
            post game_join_requests_path(game), params: { join_request: { message: "I'd love to join!" } }
        }.to change(JoinRequest, :count).by(1)

        expect(response).to redirect_to(game_path(game))
        follow_redirect!
        expect(response.body).to include("Join request submitted successfully.")
        end
    end

    describe "PATCH /games/:game_id/join_requests/:id/accept" do
        it "accepts the join request" do
            patch accept_game_join_request_path(game, join_request)
            # expect(response.body).to include('Join request accepted.')
            expect(join_request.reload.status).to eq('accepted')
        end
    end

    describe "DELETE /games/:game_id/join_requests/:id/reject" do
        it "rejects the join request" do
            delete reject_game_join_request_path(game, join_request)
            # expect(response.body).to include('Join request rejected.')
            expect(join_request.reload.status).to eq('rejected')
        end
    end
end