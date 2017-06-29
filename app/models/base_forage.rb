class BaseForage < Forage
  has_many :forage_elements, foreign_key: 'forage_id'
  belongs_to :throw
  validates_presence_of :made_at
end
