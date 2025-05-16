class CreateJoinRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :join_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.text :message
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
