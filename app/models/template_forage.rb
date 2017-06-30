class TemplateForage < Forage
  has_many :forage_elements, foreign_key: 'forage_id'
  validates_presence_of :template_name
end
