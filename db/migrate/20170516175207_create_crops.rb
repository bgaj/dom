class CreateCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.integer  :kind
      t.date  :sown_at
      t.date :harvest_at
      t.string :variant
      t.float :crop
      t.timestamps
      t.belongs_to :area
    end
  end
end
