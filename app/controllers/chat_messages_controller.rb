class ChatMessagesController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @chat_message = current_user.chat_messages.build(chat_message_params)
        @chat_message.chat_room = ChatRoom.find(params[:chat_message][:chat_room_id])
      
        if @chat_message.save

          puts render_to_string(partial: 'chat_messages/chat_message', locals: { message: @chat_message })
          ChatMessagesChannel.broadcast_to(
            @chat_message.chat_room,
            render_to_string(partial: 'chat_messages/chat_message', locals: { message: @chat_message })
          )
          head :ok
        else
          render json: { error: @chat_message.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
    private
  
    def chat_message_params
      params.require(:chat_message).permit(:content, :chat_room_id)
    end
  end