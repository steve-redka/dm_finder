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

YAML.load_file(Rails.root.join('db', 'gaming_systems.yml')).each do |gaming_system|
    GamingSystem.create!(
        name: gaming_system['name'],
        priority: gaming_system['priority'],
        group: gaming_system['group'],
    )
end

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
    gaming_system: GamingSystem.find_by(name: 'Dungeons & Dragons 5e'),
)

# if Rails.env.development? || Rails.env.test?
    10.times do
        Game.create!(
            title: Faker::Game.title,
            description: Faker::Lorem.paragraph(sentence_count: 3),
            age_restriction: ['any', '12+', '18+'].sample,
            price: rand(10..50),
            duration: rand(2.0..5.0).round(1),
            occupied_seats: rand(0..5),
            seats: 6,
            experience: ['Beginner friendly', 'Intermediate', 'Veteran only'].sample,
            system: Faker::Game.genre,
            power_level: 'Starting level 1, max level 5',
            application_process: Faker::Lorem.sentence,
            dm: admin,
            recurrence: ['once', 'weekly', 'bi-weekly'].sample,
            next_game: DateTime.now + rand(1..30).days,
            game_time: Time.now + rand(1..30).days,
            gaming_system: GamingSystem.order('RANDOM()').first,
        )
    end
# end