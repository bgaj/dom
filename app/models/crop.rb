class Crop < ApplicationRecord

  attr_accessor :areas

  enum kind: [ :pszenica, :kukurydza, :jeczmien, :zyto, :pszenzyto, :ziemniaki, :trawa, :rzepak, :groch, :lubin, :owies]

  belongs_to :area
  belongs_to :variant

  validates_presence_of :variant, :sown_at, :kind, :area
  validate :end_time_grather_then_start_time
  validate :sown_at_after_harvest, on: :create

  private

  def end_time_grather_then_start_time
     if !self.harvest_at.nil? && !self.sown_at.nil?
            if self.harvest_at < self.sown_at+1
            errors.add(:harvest_at, "Data zbioru musi nastąpić później niż data zasiewu")
          end
     end
  end

  def sown_at_after_harvest
    if !self.area.nil?
      if !self.area.crops.empty?
        if !self.area.crops.last.harvest_at.nil? && !self.sown_at.nil?
          errors.add(:sown_at, "Data nowego zasiewu musi być późniejsza od zbioru ostatniej uprawy") if self.area.crops.last.harvest_at > self.sown_at
        end
      end
    end
  end


end
