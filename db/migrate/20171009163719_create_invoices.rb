class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :list_number
      t.string :number
      t.date :made_at
      t.date :recived_at
      t.string :nip
      t.string :account_number
      t.string :name
      t.string :city
      t.string :post
      t.integer :pay_time
      t.date :pay_date
      t.float :price
      t.boolean :status, default: false
      t.integer :kind
      t.attachment :scan
      t.timestamps
    end
    create_table :invoice_elements do |t|
      t.integer :vat_kind
      t.belongs_to :invoice
      t.float :netto
      t.float :vat
      t.timestamps
    end

  end
end
