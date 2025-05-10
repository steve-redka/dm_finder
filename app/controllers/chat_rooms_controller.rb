class ChatRoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @chat_rooms = current_user.chat_rooms.includes(:chat_messages).order('chat_messages.created_at DESC').limit(10)
    end

    def show
        @chat_room = ChatRoom.find(params[:id])
        @chat_messages = @chat_room.chat_messages.includes(:user).order(created_at: :asc)
    end

    def private_message
        # This method is used to create or open an existing private chat room between two users
        @dm = User.find(params[:dm_id])
        @chatroom = ChatRoom.joins(:users)
                            .group('chat_rooms.id')
                            .having('COUNT(users.id) = 2')
                            .where(users: { id: [current_user.id, @dm.id] })
                            .first_or_initialize

        if @chatroom.new_record?
            @chatroom.title = "#{current_user.name} & #{@dm.name}"
            if @chatroom.save
                @chatroom.users << current_user
                @chatroom.users << @dm
            end
        end
        redirect_to chat_room_path(@chatroom)
    end
end