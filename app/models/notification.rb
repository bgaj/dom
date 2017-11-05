class Notification < ApplicationRecord
  belongs_to :notificaable, polymorphic: true

  validates_presence_of :dead_line, :message

  scope :to_notify, -> { where("dead_line BETWEEN ? AND ?", Date.current, Date.current + 30.days) }
end