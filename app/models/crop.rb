class Crop < ApplicationRecord

  attr_accessor :areas

  enum kind: [ :pszenica, :kukurydza, :jeczmien, :zyto, :pszenzyto, :ziemniaki, :trawa, :rzepak, :groch, :lubin, :owies]

  belongs_to :area

  validates_presence_of :variant, :sown_at, :kind, :area
end
