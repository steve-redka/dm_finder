class ChatMessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        @chat_message = current_user.chat_messages.build(chat_message_params)
        @chat_message.chat_room = ChatRoom.find(params[:chat_message][:chat_room_id])

        if @chat_message.save
            render json: @chat_message, status: :created
        else
            render json: @chat_message.errors, status: :unprocessable_entity
        end
    end 

    private

    def chat_message_params
        params.require(:chat_message).permit(:content)
    end
end