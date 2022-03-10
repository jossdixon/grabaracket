# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying..."
User.destroy_all
Racket.destroy_all
Borrow.destroy_all

puts "Seeding user"

john_smith = User.new(
  first_name: "john",
  last_name: "smith",
  email: "johnsmith@mail.com",
  password: "password",
  address: "1 World Street, London"
)
john_smith.save!

puts "Seeding racket"

Racket.create(
  brand: "Wilson",
  model: "Ultra",
  grip_size: "L4",
  weight: 295,
  head_size: 100,
  user_id: john_smith.id
)

puts "Done"
