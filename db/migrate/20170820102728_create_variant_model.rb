class CreateVariantModel < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.integer  :kind
      t.string :name
    end

    remove_column :crops, :variant, :string
    add_reference :crops, :variant, index: true
  end
end
