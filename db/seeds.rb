# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Message.destroy_all
User.destroy_all
Post.destroy_all

puts "Creating users..."


file_yoann = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088770/development/Fakebook/Git_wmkenh.jpg")

yoann = User.new(
  email: "yoann@test.com",
  password: "azerty",
  first_name: "Yoann",
  last_name: "Morillo",
  bio: "I'm so BOF :D"
)
file_yoann = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088770/development/Fakebook/Git_wmkenh.jpg")
yoann.avatar.attach(io: file_yoann, filename: "Git_wmkenh.jpg", content_type: "image/jpg")
yoann.save

sandy = User.new(
  email: "sandy@test.com",
  password: "azerty",
  first_name: "Sandy",
  last_name: "Blue",
  bio: "Look at me, I'm Sandra Dee, prancing with virginity!"
)
file_sandy = File.open("#{Rails.root}/app/assets/images/seed/mini-sandy.jpg")
sandy.avatar.attach(io: file_sandy, filename: "mini-sandy.jpg", content_type: "image/jpg")
sandy.save!

elise = User.new(
  email: "elise@test.com",
  password: "azerty",
  first_name: "Elise",
  last_name: "Rochaix",
  bio: "Hey, It's mom."
)
file_elise = URI.open("https://res.cloudinary.com/dsu8pswsx/image/upload/v1689088764/development/Fakebook/FB_IMG_1591652523870_harncz.jpg")
elise.avatar.attach(io: file_elise, filename: "FB_IMG_1591652523870_harncz.jpg", content_type: "image/jpg")
elise.save

youcef = User.new(
  email: "youcef@test.com",
  password: "azerty",
  first_name: "Youcef",
  last_name: "Haraghi",
  bio: "Hey Buddy!"
)

file_youcef = File.open("#{Rails.root}/app/assets/images/seed/youcef.png")
youcef.avatar.attach(io: file_youcef, filename: "youcef.jpg", content_type: "image/png")
youcef.save!


puts "Creating posts..."

Post.create!(content: "Hi SANNDDYYYYY", user_id: yoann.id)

post_sandy = Post.new(content: "Yoann, stop messing with me! :)", user_id: sandy.id)
file_sandy_image = File.open("#{Rails.root}/app/assets/images/seed/pretty-yoann.png")
post_sandy.post_image.attach(io: file_sandy_image, filename: "pretty-yoann.png", content_type: "image/png")
post_sandy.save!

post_youcef = Post.new(content: "Let's go hiking guys!", user_id: youcef.id)
file_youcef_image = File.open("#{Rails.root}/app/assets/images/seed/randonnee.png")
post_youcef.post_image.attach(io: file_youcef_image, filename: "randonnee.png", content_type: "image/png")
post_youcef.save!

Post.create!(content: "Hey guys! I'm new on Fakebook. Anybody have recommendations for new features?", user_id: elise.id)

post_yoann = Post.new(content: "Good times, good times... HEYYY BUDDDYYY!", user_id: yoann.id)
file_yoann_image = File.open("#{Rails.root}/app/assets/images/seed/we-love-benji.jpg")
post_yoann.post_image.attach(io: file_yoann_image, filename: "we-love-benji.jpg", content_type: "image/jpg")
post_yoann.save!

# file_youcef = URI.open('https://musicart.xboxlive.com/7/6e5b6500-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080')
# youcef = User.create!(first_name: "Youcef", last_name: "Haraghi", gender: "male", email:"youcef@test.com", password: "azerty")
# youcef.avatar.attach(io: file_youcef, filename: "tony_strak_y8t6qx.jpg", content_type: "image/jpg")
