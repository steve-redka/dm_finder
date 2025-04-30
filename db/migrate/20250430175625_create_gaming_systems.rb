class CreateGamingSystems < ActiveRecord::Migration[7.2]
  def change
    create_table :gaming_systems do |t|
      t.string :name
      t.integer :priority
      t.string :group

      t.timestamps
    end

    create_join_table :users, :gaming_systems do |t|
      t.index [:user_id, :gaming_system_id]
    end

    add_column :games, :gaming_system_id, :integer
  end
end
