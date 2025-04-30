# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin = User.create!(
    email: 'admin@mail.ru',
    name: 'admin',
    password: 'password',
    bio: 'Admin user for the application',
)

Game.create!(
    title: 'Curse of Suckula',
    description: 'A vampire-themed adventure game where players must navigate a haunted castle and defeat the evil Count Suckula.',
    age_restriction: '18+',
    price: 50.0,
    duration: 4.0,
    occupied_seats: 3,
    seats: 6,
    experience: 'Veteran only',
    system: 'Dungeons & Dragons 5th Edition',
    power_level: 'Starting level 1, max level 10',
    application_process: 'Fill out the online form and submit a character concept.',
    dm: admin,
    recurrence: 'once',
    next_game: DateTime.new(2023, 10, 15, 18, 0, 0),
    game_time: Time.new(2023, 10, 15, 18, 0, 0),
)