class ChatMessage < ApplicationRecord
    belongs_to :chat_room
    belongs_to :user
    
    validates :content, presence: true, length: { maximum: 500 }
    
    def to_s
        "#{user.name}: #{content}"
    end
    
    def self.ransackable_attributes(auth_object = nil)
        ["content"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["chat_room", "user"]
    end
end
