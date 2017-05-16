class Crop < ApplicationRecord
  enum kind: [ :pszenica, :kukurydza, :jeczmien, :zyto, :pszenzyto, :ziemniaki, :trawa, :rzepak, :groch, :lubin, :owies]

  belongs_to :area
end
