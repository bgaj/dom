class Throw < ApplicationRecord
  has_many :throws_assignment
  has_many :sales, through: :throws_assignment
  has_many :base_forages
  has_many :forage_elements, through: :base_forages
  before_create :create_number
  before_update :check_close

  validates_presence_of :buy_at, :qty, :buy_cost, :weight
  validates :qty, :numericality=> { :greater_than => 0 }, allow_blank: false
  validates :buy_cost, :numericality => { :greater_than => 0 }, allow_blank: false
  validates :sell_qty, :numericality=> { :greater_than => 0 }, allow_blank: true
  validates :drop_qty, :numericality=> { :greater_than => 0 }, allow_blank: true
  validates :weight, :numericality=> { :greater_than => 0 }, allow_blank: false
  validate :qty_grather_equal_sell

  private

  def create_number
    self.number = 'Nr '
    self.number += (Throw.where(buy_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year).count + 1).to_s
    self.number +='-'
    self.number += Time.now.year.to_s
  end

  def qty_grather_equal_sell
    errors[:qty] << "Musi być większa od #{sell_qty.to_i + drop_qty.to_i}" if qty.to_i < sell_qty.to_i + drop_qty.to_i
  end

  def check_close
    self.close = true if qty.to_i == sell_qty.to_i + drop_qty.to_i
  end

end
