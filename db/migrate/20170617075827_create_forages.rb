class CreateForages < ActiveRecord::Migration[5.0]
  def change
    create_table :forages do |t|
      t.date :made_at
      t.belongs_to :throw
      t.string :type
      t.string :template_name
    end
  end
end
