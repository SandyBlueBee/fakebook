# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


Message.destroy_all
User.destroy_all
Post.destroy_all

puts "Creating users..."
# User.create!(first_name: "Yoann", last_name: "Morillo", gender: "male", email:"yoann@test.com", password: "azerty")
# User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
# User.create!(first_name: "Sandy", last_name: "Blue", gender: "female", email:"sandy@test.com", password: "azerty")
file_yoann = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088770/development/Fakebook/Git_wmkenh.jpg")
yoann = User.new(
  email: "yoann@test.com",
  password: "azerty",
  first_name: "Yoann",
  last_name: "Morillo",
  bio: "I'm so BOF :D"
)
yoann.avatar.attach(io: file_yoann, filename: "Git_wmkenh.jpg", content_type: "image/jpg")
yoann.save

file_sandy = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088764/development/Fakebook/FB_IMG_1591652523870_harncz.jpg")
sandy = User.new(
  email: "sandy@test.com",
  password: "azerty",
  first_name: "Sandy",
  last_name: "Blue",
  bio: "Look at me, I'm Sandra Dee, prancing with virginity!"
)
sandy.avatar.attach(io: file_sandy, filename: "FB_IMG_1591652523870_harncz.jpg", content_type: "image/jpg")
sandy.save

file_elise = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088764/development/Fakebook/FB_IMG_1591652523870_harncz.jpg")
elise = User.new(
  email: "elise@test.com",
  password: "azerty",
  first_name: "elise",
  last_name: "Rochaix",
  bio: "Hey, it's mom."
)
elise.avatar.attach(io: file_elise, filename: "FB_IMG_1591652523870_harncz.jpg", content_type: "image/jpg")
elise.save

file_youcef = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088770/development/Fakebook/Git_wmkenh.jpg")
youcef = User.new(
  email: "youcef@test.com",
  password: "azerty",
  first_name: "youcef",
  last_name: "Haraghi",
  bio: "Hey Buddy!"
)
youcef.avatar.attach(io: file_youcef, filename: "Git_wmkenh.jpg", content_type: "image/jpg")
youcef.save
puts "Creating posts..."

Post.create!(content: "Hi SANNDDYYYYY", user_id: yoann.id)
Post.create!(content: "Yoann, stop messing with me! :)", user_id: sandy.id)
Post.create!(content: "Let's go hiking guys!", user_id: youcef.id)
Post.create!(content: "Hey guys! I'm new on Fakebook. Anybody have recommendations for new features?", user_id: elise.id)



# file_youcef = URI.open('https://musicart.xboxlive.com/7/6e5b6500-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080')
# youcef = User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
# youcef.avatar.attach(io: file_youcef, filename: "tony_strak_y8t6qx.jpg", content_type: "image/jpg")
