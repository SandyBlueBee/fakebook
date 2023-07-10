# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Message.destroy_all
puts "Creating users..."
User.destroy_all
User.create!(first_name: "Yoann", last_name: "Morillo", gender: "male", email:"yoann@test.com", password: "azerty")
# User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
User.create!(first_name: "Sandy", last_name: "Blue", gender: "female", email:"sandy@test.com", password: "azerty")

puts "Creating posts..."
Post.destroy_all
Post.create!(content: "Hi SANNDDYYYYY", user: User.first)
Post.create!(content: "Hey guys! I'm new on Fakebook. Anybody have recommendations for new features?", user: User.last)
Post.create!(content: "Yoann, stop messing with me! :)", user: User.last)


file_youcef = URI.open('https://musicart.xboxlive.com/7/6e5b6500-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080')
youcef = User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
youcef.avatar.attach(io: file_youcef, filename: "tony_strak_y8t6qx.jpg", content_type: "image/jpg")
