class AddDescriptionToCrops < ActiveRecord::Migration[5.2]
  def change
    add_column :crops, :description, :text
  end
end
