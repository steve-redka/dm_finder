class CreateChatMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :chat_messages do |t|
      t.text :content
      t.references :user
      t.references :chat_room

      t.timestamps
    end
  end
end
