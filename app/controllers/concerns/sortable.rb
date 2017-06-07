module Sortable
  extend ActiveSupport::Concern

  module ClassMethods

    def sorted(column, direction = nil)
      order = [column, direction].reject(&:blank?).join(' ').to_s
      order(order)
    end

  end
end