class Area < ApplicationRecord
  enum status: [:own,:lease]
  has_many :coordinates, dependent: :destroy
  has_many :crops, dependent: :destroy
  belongs_to :area_class
  has_and_belongs_to_many :events

  validates_presence_of :area_class, :status, :name, :area
  validates_uniqueness_of :name
  validates :comment, length: { maximum: 255 }
  validates_inclusion_of :area, :in => 0.1..20
end
