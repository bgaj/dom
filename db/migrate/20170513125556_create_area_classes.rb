class CreateAreaClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :area_classes do |t|
      t.string :name
      t.integer :order
      t.timestamps
    end
    add_reference :areas, :area_class
  end
end
