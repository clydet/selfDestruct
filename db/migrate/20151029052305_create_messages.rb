class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text    :content
      t.text    :recipient
      t.text    :password
      t.text    :message_id, :unique => true
      t.boolean :viewed

      t.timestamps null: false
    end
  end
end
