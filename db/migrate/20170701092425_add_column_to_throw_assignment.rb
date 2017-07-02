class AddColumnToThrowAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :throws_assignments, :price, :float, default: 0
    add_column :throws_assignments, :weight, :float, default: 0
    add_column :throws, :sell_total, :float, default: 0
    add_column :throws, :weight_total, :float, default: 0
  end
end
