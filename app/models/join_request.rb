class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :message, presence: true, length: { minimum: 5 }
  validates :status, inclusion: { in: %w[pending accepted rejected] }
end