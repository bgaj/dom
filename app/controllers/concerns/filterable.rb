module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    def filter(filter_params)
      results = self.where(nil)
      filter_params.each do |k, v|
        results = results.public_send(k, v) if v.present?
      end
      results
    end

  end
end