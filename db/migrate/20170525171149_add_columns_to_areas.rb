class AddColumnsToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :status, :integer
    add_column :areas, :cultivate_from, :date
    add_column :areas, :comment, :string
  end
end
