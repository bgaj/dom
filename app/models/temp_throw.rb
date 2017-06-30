class TempThrow
  include ActiveModel::Model

  attr_accessor :throw
  attr_accessor :percent

  validates :throw, :percent, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
