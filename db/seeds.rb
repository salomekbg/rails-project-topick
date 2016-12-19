# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Topic.create(name: "Science")
Topic.create(name: "Animals")
Topic.create(name: "Music")
Topic.create(name: "Technology")
Topic.create(name: "Movies")
Topic.create(name: "Art")
Topic.create(name: "Religion")
Topic.create(name: "Board Games")
Topic.create(name: "Humor")
Topic.create(name: "Love")
Topic.create(name: "Humor")
Topic.create(name: "Gaming")
Topic.create(name: "News")
Topic.create(name: "Sports")
Topic.create(name: "Politics")

# 10.times do
#   User.create(username: Faker::Pokemon.name.downcase, password: "password", password_confirmation: "password")
# end

10.times do
  room = Room.create(name: Faker::Superhero.name, topic_id: rand(1..Topic.all.length))
  rand(1..5).times do
    room.users << User.find(rand(1..User.all.length))
  end
  room = Room.create(name: Faker::StarWars.character, topic_id: rand(1..Topic.all.length))
  rand(1..5).times do
    room.users << User.find(rand(1..User.all.length))
  end
  room = Room.create(name: Faker::Team.creature, topic_id: rand(1..Topic.all.length))
  rand(1..5).times do
    room.users << User.find(rand(1..User.all.length))
  end
end
