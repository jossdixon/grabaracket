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
