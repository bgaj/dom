class CreateCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinates do |t|
      t.string :coordinate
      t.belongs_to :area
      t.timestamps
    end
  end
end
