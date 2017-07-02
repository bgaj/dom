class ThrowsAssignment < ApplicationRecord
  belongs_to :throw
  belongs_to :sale
  validates_presence_of :qty, :throw_id
  validate :available_qty, if: :throw_id
  validates :throw_id, :uniqueness => {:scope=>:sale_id}

  after_create :on_create_update_sell_qty
  after_update :on_update_sell_qty
  before_destroy :update_throw

  def available_qty
    self.errors[:qty] << "Maksymalnie #{self.throw.qty - (self.throw.sell_qty.to_i  + self.throw.drop_qty.to_i) + qty_was.to_i}" if (self.throw.sell_qty.to_i + self.qty + self.throw.drop_qty.to_i - self.qty_was.to_i) > self.throw.qty.to_i
  end

  def on_create_update_sell_qty
    throw.sell_qty = throw.sell_qty.to_i + qty
    throw.save
  end

  def on_update_sell_qty
    throw.sell_qty = throw.sell_qty.to_i - (qty_was - qty)
    throw.save
  end

  def update_throw
    throw.update_attributes(sell_total: (throw.sell_total - price), weight_total: (throw.weight_total - weight))
  end

end
