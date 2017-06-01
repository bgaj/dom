# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {
    email: 'admin@admin.pl',
    password: 'krzyzanow'
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


1.upto(11) do |i|
  name="pole"+i.to_s
    area_params = {
        name: name,
        area: 1,
        status: 0,
        area_class_id: 1,
    }
    if Area.where(name: area_params[:name]).empty?
        Area.create!(area_params)
    end
end

1.upto(22) do |i|
    sown_at= (10..20).to_a.sample.years.ago
    crop_params = {
        kind: i % 10,
        sown_at: sown_at,
        variant: "test",
        harvest_at: sown_at + 2.days,
        area_id: Area.order( "RAND()").first.id
    }
    Crop.create!(crop_params)

end