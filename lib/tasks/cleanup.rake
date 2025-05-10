namespace :chatrooms do
    desc "Delete empty chatrooms"
    task cleanup: :environment do
        Chatroom.left_joins(:messages).where(messages: { id: nil }).destroy_all
        puts "Empty chatrooms cleaned up"
    end
end