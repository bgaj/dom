class TemplateForage < Forage
  has_many :forage_elements, foreign_key: 'forage_id'


end
