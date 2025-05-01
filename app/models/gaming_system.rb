class GamingSystem < ApplicationRecord
    has_many :games
    has_and_belongs_to_many :users
  
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    def self.ransackable_attributes(auth_object = nil)
      ["name"]
    end
    
  end