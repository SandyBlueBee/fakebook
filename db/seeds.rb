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
# User.create!(first_name: "Yoann", last_name: "Morillo", gender: "male", email:"yoann@test.com", password: "azerty")
# User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
# User.create!(first_name: "Sandy", last_name: "Blue", gender: "female", email:"sandy@test.com", password: "azerty")
file_yoann = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088770/development/Fakebook/Git_wmkenh.jpg")
yoann = User.new(
  email: "yoann@test.com",
  password: "azerty",
  first_name: "Yoann",
  last_name: "Morillo"
)
yoann.avatar.attach(io: file_yoann, filename: "Git_wmkenh.jpg", content_type: "image/jpg")
yoann.save

file_sandy = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088764/development/Fakebook/FB_IMG_1591652523870_harncz.jpg")
sandy = User.new(
  email: "sandy@test.com",
  password: "azerty",
  first_name: "Sandy",
  last_name: "Blue"
)
sandy.avatar.attach(io: file_sandy, filename: "FB_IMG_1591652523870_harncz.jpg", content_type: "image/jpg")
sandy.save

puts "Creating posts..."
Post.destroy_all

Post.create!(content: "Hi SANNDDYYYYY", user_id: yoann.id)
Post.create!(content: "Hey guys! I'm new on Fakebook. Anybody have recommendations for new features?", user_id: sandy.id)
Post.create!(content: "Yoann, stop messing with me! :)", user_id: sandy.id)



# file_youcef = URI.open('https://musicart.xboxlive.com/7/6e5b6500-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080')
# youcef = User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
# youcef.avatar.attach(io: file_youcef, filename: "tony_strak_y8t6qx.jpg", content_type: "image/jpg")
