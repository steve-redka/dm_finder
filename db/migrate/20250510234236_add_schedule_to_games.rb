class AddScheduleToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :schedule, :text
  end
end
