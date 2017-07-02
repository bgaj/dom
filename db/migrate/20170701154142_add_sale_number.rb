class AddSaleNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :number, :string
  end
end
