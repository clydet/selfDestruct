class CreateMessages < ActiveRecord::Migration
  def change
  	drop_table :messages
    create_table :messages do |t|
      t.text :content
      t.text :recipient
      t.text :password

      t.timestamps null: false
    end
  end
end
