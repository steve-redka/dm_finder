class Game < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :age_restriction, presence: true, inclusion: { in: ['18+', '16+', '12+'], 
        message: "%{value} is not a valid age restriction" }
    validates :application_process, presence: true, length: { minimum: 20 }
end
