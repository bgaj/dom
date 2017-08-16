class Sale < ApplicationRecord
  has_many :throws_assignment, dependent: :destroy
  has_many :throws, through: :throws_assignment
  accepts_nested_attributes_for :throws_assignment, allow_destroy: true

  attr_accessor :calculate

  validates_presence_of :throws_assignment, :number, :vat, :total, :total_netto, :sell_at, :price, :weight

  after_create :update_throws

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

  def self.valid_attribute?(attr, value)
    mock = self.new(attr => value)
    if mock.valid?
      true
    else
      !mock.errors.has_key?(attr)
    end
  end
end
