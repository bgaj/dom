class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.date :sell_at
      t.float :price
      t.float :total
      t.float :weight
      t.timestamps
    end
  end
end
