# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require_relative 'development_seeds'

admin = User.create!(
    email: 'admin@mail.ru',
    name: 'admin',
    password: 'password',
    bio: 'Admin user for the application',
)

YAML.load_file(Rails.root.join('db', 'gaming_systems.yml')).each do |gaming_system|
    GamingSystem.create!(
        name: gaming_system['name'],
        priority: gaming_system['priority'],
        group: gaming_system['group'],
    )
end

if Rails.env.development? || Rails.env.test?
    # see development_seeds.rb
    DevelopmentSeeds.seed()
end