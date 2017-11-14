# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Task.destroy_all
List.destroy_all

10.times do |index|
  list = List.create!(
  name:Faker::RickAndMorty.character,
  created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
  updated_at: Faker::Date.backward(7),
  description:Faker::Lorem.sentence(20, false, 0).chop)
  20.times do |index|
    Task.create!(
    description:Faker::RickAndMorty.quote,
    created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    updated_at: Faker::Date.backward(7),
    list_id: list.id,
    done: Faker::Boolean.boolean(0.2))
  end

end

  p "created #{List.count} lists"
  p "created #{Task.count} tasks"
