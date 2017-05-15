class Area < ApplicationRecord
  has_many :coordinates
  belongs_to :area_class
end
