class Forage < ApplicationRecord
  has_many :forage_elements
  accepts_nested_attributes_for :forage_elements, allow_destroy: true

  validates_presence_of :forage_elements

end
