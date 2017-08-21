class Variant < ApplicationRecord

  enum kind: [ :pszenica, :kukurydza, :jeczmien, :zyto, :pszenzyto, :ziemniaki, :trawa, :rzepak, :groch, :lubin, :owies]

  has_many :crops
  validates_presence_of :name, :kind
  validates :name, uniqueness: { scope: :kind }

end
