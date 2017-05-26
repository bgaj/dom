class Event < ApplicationRecord

  enum event: [ :orka ,:oprysk, :nawozenie, :uprawa, :koszenie ]

  has_and_belongs_to_many :areas

  validates_presence_of :event, :made_at, :areas

end
