class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :bio, length: { maximum: 5000 }

  has_many :dmed_games, foreign_key: :dm_id
  has_and_belongs_to_many :games, join_table: :games_users
  has_and_belongs_to_many :gaming_systems

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_and_belongs_to_many :chat_rooms
  has_many :chat_messages
end
