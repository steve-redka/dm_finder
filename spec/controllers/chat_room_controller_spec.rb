require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
    let(:user) { create(:user) }
    let(:chat_room) { create(:chat_room) }
    let!(:chat_messages) { create_list(:chat_message, 5, chat_room: chat_room) }
    let(:user2) { create(:user) }

    before do
        sign_in user
        user.chat_rooms << chat_room
    end

    describe "GET #index" do
        it "redirects to login if user is not authenticated" do
            sign_out user
            get :index
            expect(response).to redirect_to(new_user_session_path)
        end

        it "assigns @chat_rooms with the user's chat rooms" do
            get :index
            expect(assigns(:chat_rooms)).to eq([chat_room])
        end

        it "limits @chat_rooms to 10 records" do
            create_list(:chat_room, 15, users: [user])
            get :index
            expect(assigns(:chat_rooms).count).to eq(10)
        end
    end

    describe "GET #show" do
        it "redirects to login if user is not authenticated" do
            sign_out user
            get :show, params: { id: chat_room.id }
            expect(response).to redirect_to(new_user_session_path)
        end

        it "assigns @chat_room with the correct chat room" do
            get :show, params: { id: chat_room.id }
            expect(assigns(:chat_room)).to eq(chat_room)
        end

        it "assigns @chat_messages with the chat room's messages in ascending order" do
            get :show, params: { id: chat_room.id }
            expect(assigns(:chat_messages)).to eq(chat_messages.sort_by(&:created_at))
        end

        it "renders the show template" do
            get :show, params: { id: chat_room.id }
            expect(response).to render_template(:show)
        end
    end

    describe 'POST #private_message' do
        context 'when a chatroom does not exist' do
            it 'creates a new chatroom with the two users' do
                expect {
                    post :private_message, params: { dm_id: user2.id }
                }.to change(ChatRoom, :count).by(1)

                chatroom = ChatRoom.last
                expect(chatroom.users).to include(user, user2)
                expect(response).to redirect_to(chat_room_path(chatroom))
            end
        end

        context 'when a chatroom already exists' do
            let!(:existing_chatroom) { create(:chat_room, users: [user, user2]) }

            it 'does not create a new chatroom and redirects to the existing one' do
                expect {
                post :private_message, params: { dm_id: user2.id }
                }.not_to change(ChatRoom, :count)

                expect(response).to redirect_to(chat_room_path(existing_chatroom))
            end
        end
    end
end