class CreateForageElements < ActiveRecord::Migration[5.0]
  def change
    create_table :forage_elements do |t|
      t.belongs_to :forage
      t.integer :kind
      t.float :weight
      t.float :price
      t.timestamps
    end
  end
end
