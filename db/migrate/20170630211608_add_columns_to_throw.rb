class AddColumnsToThrow < ActiveRecord::Migration[5.0]
  def change
    add_column :throws, :eat_weight, :float, default: 0
    add_column :throws, :eat_costs, :float, default: 0
    add_column :throws, :additional_costs, :float, default: 0
  end
end
