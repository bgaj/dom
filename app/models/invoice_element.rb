class InvoiceElement < ApplicationRecord

  enum vat_kind: [ :vat_5, :vat_8, :vat_23]

  belongs_to :invoice

  validates_presence_of :vat_kind, :netto, :vat
  validates :netto, :numericality=> { :greater_than => 0 }, allow_blank: false
  validates :vat, :numericality => { :greater_than => 0 }, allow_blank: false


end

