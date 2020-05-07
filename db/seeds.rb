# This file should ctontain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all




10.times do |index|
	city_test = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: Faker::Number.between(from: 1, to: 80), city: city_test)
	Tag.create!(title: Faker::Book.genre)
end

20.times do
	Gossip.create!(title: Faker::Lorem.sentence(word_count: 4), content: Faker::Lorem.sentence(word_count: 30), user: User.find(rand(User.first.id..User.last.id)), tags: [Tag.find(rand(Tag.first.id..Tag.last.id)), Tag.find(rand(Tag.first.id..Tag.last.id))])	
end