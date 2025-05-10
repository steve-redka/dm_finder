module DevelopmentSeeds
    # This module is used to seed the database with mock data for development and testing purposes.
    
    def self.seed
        admin = User.find_by(email: 'admin@mail.ru')

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

        5.times do
            FactoryBot.create(:user)
        end

        # 5.times do
        #     chat_room = FactoryBot.create(:chat_room)
        #     chat_room.users << User.all.sample(1)
        #     chat_room.users << admin
        #     10.times do
        #         chat_room.chat_messages.create!(
        #             user: chat_room.users.sample,
        #             content: Faker::Lorem.sentence(word_count: 10),
        #         )
        #     end
        # end
    end
end