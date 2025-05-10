class ChatRoom < ApplicationRecord
    has_many :chat_messages, dependent: :destroy
    has_and_belongs_to_many :users
end
