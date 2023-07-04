# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users..."
User.destroy_all
User.create!(first_name: "Yoann", last_name: "Morillo", gender: "male", email:"yoann@test.com", password: "azerty")
User.create!(first_name: "Sandy", last_name: "Blue", gender: "female", email:"sandy@test.com", password: "azerty")
