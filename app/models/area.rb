class Area < ApplicationRecord
  has_many :coordinates
  belongs_to :area_class
  has_and_belongs_to_many :events
end
