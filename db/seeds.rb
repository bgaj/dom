# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {
    email: 'admin@admin.pl',
    password: 'admin'
}
User.create!(user) if User.where(email: 'admin@admin.pl').empty? && Rails.env.development?

classes= [
    {
      name: 'I',
      order: 1,
    },
    {
        name: 'II',
        order: 2,
    },
    {
        name: 'III a',
        order: 3,
    },
    {
        name: 'III b',
        order: 4,
    },
    {
        name: 'IV a',
        order: 5,
    },
    {
        name: 'IV b',
        order: 6,
    },
    {
        name: 'V',
        order: 7,
    },
    {
        name: 'VI',
        order: 8,
    }
]
classes.each do |c|
  AreaClass.find_or_create_by(name: c[:name], order: c[:order])
end