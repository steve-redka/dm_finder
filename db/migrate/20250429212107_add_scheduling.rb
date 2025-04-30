class AddScheduling < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :game_time, :time
    add_column :games, :recurrence, :string
    add_column :games, :next_game, :date
    add_column :games, :platform, :string
  end
end
