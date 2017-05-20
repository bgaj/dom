class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string :name
      t.float :hours
      t.date :buy
      t.date :sell
      t.date :made_at
      t.string :description
      t.timestamps
    end
  end
end
