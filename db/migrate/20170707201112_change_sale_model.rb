class ChangeSaleModel < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :total_netto, :float
    add_column :sales, :vat, :float
  end
end
