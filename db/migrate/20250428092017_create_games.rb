class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :age_restriction
      t.float :price
      t.float :duration
      t.integer :seats
      t.text :experience
      t.string :system
      t.string :power_level
      t.text :application_process

      t.timestamps
    end
  end
end
