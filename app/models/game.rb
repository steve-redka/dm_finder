class Game < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :age_restriction, presence: true, inclusion: { in: ['18+', '16+', '12+', 'any'], 
        message: "%{value} is not a valid age restriction" }
    # validates :application_process, presence: true, length: { minimum: 20 }
    validates :recurrence, inclusion: { in: ['', 'one-shot', 'weekly', 'play-by-post', 'asynchronous', 'other'],
        message: "%{value} is not a valid recurrence" }

    has_and_belongs_to_many :users, join_table: 'games_users'
    belongs_to :dm, class_name: 'User', foreign_key: 'dm_id', optional: true

    has_one_attached :cover_image  
    belongs_to :gaming_system


    def self.ransackable_attributes(auth_object = nil)
        ["title", "description", "age_restriction", "gaming_system_id", 'next_occurrence', 'recurrence',
        'next_game', 'next_game_gteq', 'next_game_lteq', 'earliest_time', 'latest_time']
      end
      
      
      def self.ransackable_associations(auth_object = nil)
        ["gaming_system"]
      end
      # scope :next_game_date_gteq, ->(datetime) { where('next_game_date >= ?', datetime) }
      # scope :next_game_date_lteq, ->(datetime) { where('next_game_date <= ?', datetime) }
end
