class ChatRoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @chat_rooms = current_user.chat_rooms.includes(:chat_messages).order('chat_messages.created_at DESC').limit(10)
    end

    def show
        @chat_room = ChatRoom.find(params[:id])
        @chat_messages = @chat_room.chat_messages.includes(:user).order(created_at: :asc)
    end
end