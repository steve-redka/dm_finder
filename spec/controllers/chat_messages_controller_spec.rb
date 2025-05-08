require 'rails_helper'

RSpec.describe ChatMessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:chat_room) { create(:chat_room) }

  before do
    sign_in user
    chat_room.users << user
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new chat message" do
        expect {
          post :create, params: { chat_message: { content: "Hello!", chat_room_id: chat_room.id } }
        }.to change(ChatMessage, :count).by(1)
      end

      it "broadcasts the message to the chat room" do
        expect(ActionCable.server).to receive(:broadcast)
        post :create, params: { chat_message: { content: "Hello!", chat_room_id: chat_room.id } }
      end
    end

    context "with invalid attributes" do
      it "does not create a new chat message" do
        expect {
          post :create, params: { chat_message: { content: "", chat_room_id: chat_room.id } }
        }.not_to change(ChatMessage, :count)
      end

      it "returns an error response" do
        post :create, params: { chat_message: { content: "", chat_room_id: chat_room.id } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end