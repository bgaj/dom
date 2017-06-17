class CreateThrowsAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :throws_assignments do |t|
      t.belongs_to :throw
      t.belongs_to :sale
      t.integer :qty
      t.timestamps
    end
  end
end
