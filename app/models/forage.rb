class Forage < ApplicationRecord
  has_many :forage_elements
  accepts_nested_attributes_for :forage_elements, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :forage_elements

end
