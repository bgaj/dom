class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.datetime :last_notification
      t.date :dead_line
      t.boolean :finished, default: false
      t.integer :notificaable_id
      t.string  :notificaable_type
      t.timestamps
    end
  end
end
