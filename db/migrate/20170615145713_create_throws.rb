class CreateThrows < ActiveRecord::Migration[5.0]
  def change
    create_table :throws do |t|
      t.date :buy_at
      t.string :number
      t.integer :qty
      t.float :buy_cost
      t.float :weight
      t.integer :sell_qty
      t.integer :drop_qty
      t.boolean :close, default: false
      t.timestamps
    end
  end
end
