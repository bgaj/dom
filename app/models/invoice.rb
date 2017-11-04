class Invoice < ApplicationRecord
  has_many :invoice_elements
  accepts_nested_attributes_for :invoice_elements, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :number, :made_at, :pay_date, :recived_at, :name, :city, :post, :nip


end

