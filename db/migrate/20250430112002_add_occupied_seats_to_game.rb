class AddOccupiedSeatsToGame < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :occupied_seats, :integer
  end
end
