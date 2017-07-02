class Sale < ApplicationRecord
  has_many :throws_assignment, dependent: :destroy
  has_many :throws, through: :throws_assignment
  accepts_nested_attributes_for :throws_assignment, allow_destroy: true

  validates_presence_of :throws_assignment

  after_create :update_throws
  before_create :create_number

  private

  def update_throws
    total_qty = 0
    throws_assignment.each do |throw|
      total_qty += throw.qty
    end
    throws_assignment.each do |throw|
      throw.update_attribute :price, ((total * throw.qty)/ total_qty)
      throw.update_attribute :weight, ((weight * throw.qty)/ total_qty)
      throw.throw.update(sell_total: (throw.throw.sell_total + throw.price), weight_total: (throw.throw.weight_total + throw.weight))
    end
  end

  def create_number
    self.number = 'Faktura '
    self.number += (Sale.where(sell_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year).count + 1).to_s
  end
end
