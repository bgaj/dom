class CreateInvoiceTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_templates do |t|
      t.string :account_number
      t.string :name
      t.timestamps
    end
  end
end
