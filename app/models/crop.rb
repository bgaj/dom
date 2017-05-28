class Crop < ApplicationRecord

  attr_accessor :areas

  enum kind: [ :pszenica, :kukurydza, :jeczmien, :zyto, :pszenzyto, :ziemniaki, :trawa, :rzepak, :groch, :lubin, :owies]

  belongs_to :area

  validates_presence_of :variant, :sown_at, :kind, :area
  validate :end_time_grather_then_start_time


  private

    def end_time_grather_then_start_time
      if self.harvest_at < self.sown_at+1
        errors.add(:harvest_at, "Data zbioru musi nastąpić później niż data zasiewu")
      end
    end


end
