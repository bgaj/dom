class Sale < ApplicationRecord
  has_many :throws_assignment
  has_many :throws, through: :throws_assignment
  accepts_nested_attributes_for :throws_assignment, allow_destroy: true

  validates_presence_of :throws_assignment
end
