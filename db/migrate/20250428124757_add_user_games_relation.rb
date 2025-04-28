class AddUserGamesRelation < ActiveRecord::Migration[7.2]
  def change
    # Create a join table for the many-to-many relationship between users and games
    create_table :games_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :game
    end

    # Add indexes for faster querying
    add_index :games_users, [:user_id, :game_id], unique: true
    add_index :games_users, [:game_id, :user_id], unique: true

    # Add foreign keys for referential integrity
    add_foreign_key :games_users, :users
    add_foreign_key :games_users, :games

    # Add a column to the games table to store the id of user who is a DM for the game
    add_column :games, :dm_id, :integer

    # Add an index to the dm_id column for faster querying
    add_index :games, :dm_id

    # Add a foreign key constraint to ensure that dm_id references a valid user
    add_foreign_key :games, :users, column: :dm_id
  end
end
