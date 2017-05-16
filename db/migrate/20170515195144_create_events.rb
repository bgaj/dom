class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :event
      t.date :made_at
      t.text :description
      t.text :comment
      t.float :cost
      t.timestamps
    end

    create_table :areas_events do |t|
      t.belongs_to :event
      t.belongs_to :area
    end
  end
end
