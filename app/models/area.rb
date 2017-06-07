class Area < ApplicationRecord

  include Filterable

  enum status: [:own,:lease]
  has_many :coordinates, dependent: :destroy
  has_many :crops, dependent: :destroy
  belongs_to :area_class
  has_and_belongs_to_many :events

  validates_presence_of :area_class, :status, :name, :area
  validates_uniqueness_of :name
  validates :comment, length: { maximum: 255 }
  validates_inclusion_of :area, :in => 0.1..20


  scope :available, -> { all.reject{|a| a.crops.map{|c|  c.harvest_at.blank?}.any?} }
  # SELECT areas.* FROM areas WHERE areas.id ORDER BY FIELD (id,(SELECT m1.area_id FROM crops m1 LEFT JOIN crops m2 ON (m1.area_id = m2.area_id AND m1.sown_at < m2.sown_at) WHERE m2.id IS NULL ORDER BY m1.kind))
  scope :status, -> (status) { where(status: status) }
end
