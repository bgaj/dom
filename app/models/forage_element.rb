class ForageElement < ApplicationRecord
  enum kind: [ :pszenica, :pszenzyto, :jeczmien, :kukurydza, :lubin, :soja]

  belongs_to :base_forage, foreign_key: 'forage_id'
  belongs_to :template_forage, foreign_key: 'forage_id'
  has_one :throw, through: :base_forage

  validates_presence_of :kind, :weight, :price
  validates :weight, :numericality=> { :greater_than => 0 }, allow_blank: false
  validates :price, :numericality => { :greater_than => 0 }, allow_blank: false


end
