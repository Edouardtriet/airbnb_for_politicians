# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Clear existing data
puts "Cleaning database..."
Booking.destroy_all
Listing.destroy_all
User.destroy_all

# Create users
puts "Creating users..."
user1 = User.create!(
  email: "alice@example.com",
  password: "password",
  name: "Alice Smith"
)

user2 = User.create!(
  email: "bob@example.com",
  password: "password",
  name: "Bob Johnson"
)

user3 = User.create!(
  email: "politician1@example.com",
  password: "password",
  name: "Jane Politician"
)

user4 = User.create!(
  email: "politician2@example.com",
  password: "password",
  name: "John Statesman"
)

# Create listings (politician profiles)
puts "Creating listings..."
listing1 = Listing.create!(
  name: "Donald Trump",
  type_of_event: "speech",
  price: 100000.00,
  location: "Mar-a-Lago, Florida",
  availability_start: DateTime.now + 1.day,
  availability_end: DateTime.now + 30.days,
  user: user2
)

listing2 = Listing.create!(
  name: "Barack Obama",
  type_of_event: "speech",
  price: 125000.00,
  location: "Chicago",
  availability_start: DateTime.now + 2.days,
  availability_end: DateTime.now + 45.days,
  user: user1
)

listing3 = Listing.create!(
  name: "Kamala Harris",
  type_of_event: "debate",
  price: 95000.00,
  location: "Washington DC",
  availability_start: DateTime.now + 5.days,
  availability_end: DateTime.now + 60.days,
  user: user3
)

listing4 = Listing.create!(
  name: "Alexandria Ocasio-Cortez",
  type_of_event: "meeting",
  price: 65000.00,
  location: "New York City",
  availability_start: DateTime.now + 7.days,
  availability_end: DateTime.now + 40.days,
  user: user4
)

listing5 = Listing.create!(
  name: "Bernie Sanders",
  type_of_event: "speech",
  price: 75000.00,
  location: "Burlington, Vermont",
  availability_start: DateTime.now + 3.days,
  availability_end: DateTime.now + 50.days,
  user: user2
)

listing6 = Listing.create!(
  name: "Mitch McConnell",
  type_of_event: "fundraising",
  price: 85000.00,
  location: "Louisville, Kentucky",
  availability_start: DateTime.now + 10.days,
  availability_end: DateTime.now + 35.days,
  user: user1
)

listing7 = Listing.create!(
  name: "Nancy Pelosi",
  type_of_event: "dinner",
  price: 90000.00,
  location: "San Francisco",
  availability_start: DateTime.now + 14.days,
  availability_end: DateTime.now + 42.days,
  user: user3
)

listing8 = Listing.create!(
  name: "Boris Johnson",
  type_of_event: "speech",
  price: 80000.00,
  location: "London",
  availability_start: DateTime.now + 8.days,
  availability_end: DateTime.now + 38.days,
  user: user4
)

listing9 = Listing.create!(
  name: "Justin Trudeau",
  type_of_event: "meeting",
  price: 70000.00,
  location: "Toronto",
  availability_start: DateTime.now + 6.days,
  availability_end: DateTime.now + 55.days,
  user: user2
)

listing10 = Listing.create!(
  name: "Emmanuel Macron",
  type_of_event: "dinner",
  price: 110000.00,
  location: "Paris",
  availability_start: DateTime.now + 12.days,
  availability_end: DateTime.now + 40.days,
  user: user1
)

listing11 = Listing.create!(
  name: "Angela Merkel",
  type_of_event: "debate",
  price: 95000.00,
  location: "Berlin",
  availability_start: DateTime.now + 9.days,
  availability_end: DateTime.now + 36.days,
  user: user3
)

listing12 = Listing.create!(
  name: "Narendra Modi",
  type_of_event: "other",
  price: 85000.00,
  location: "New Delhi",
  availability_start: DateTime.now + 15.days,
  availability_end: DateTime.now + 45.days,
  user: user4
)

listing13 = Listing.create!(
  name: "Jacinda Ardern",
  type_of_event: "meeting",
  price: 60000.00,
  location: "Auckland",
  availability_start: DateTime.now + 4.days,
  availability_end: DateTime.now + 30.days,
  user: user2
)

listing14 = Listing.create!(
  name: "Volodymyr Zelenskyy",
  type_of_event: "fundraising",
  price: 120000.00,
  location: "Kyiv",
  availability_start: DateTime.now + 20.days,
  availability_end: DateTime.now + 50.days,
  user: user1
)

listing15 = Listing.create!(
  name: "Olaf Scholz",
  type_of_event: "other",
  price: 70000.00,
  location: "Hamburg",
  availability_start: DateTime.now + 11.days,
  availability_end: DateTime.now + 40.days,
  user: user3
)

# Attach images to listings
puts "Attaching images to listings..."

listing1.image.attach(
  io: File.open(Rails.root.join('app/assets/images/donald.jpg')),
  filename: 'donald.jpg',
  content_type: 'image/jpg'
)

listing2.image.attach(
  io: File.open(Rails.root.join('app/assets/images/Obama.jpg')),
  filename: 'Obama.jpg',
  content_type: 'image/jpg'
)

listing3.image.attach(
  io: File.open(Rails.root.join('app/assets/images/kamala.jpg')),
  filename: 'kamala.jpg',
  content_type: 'image/jpg'
)

listing4.image.attach(
  io: File.open(Rails.root.join('app/assets/images/Alexandria.jpg')),
  filename: 'Alexandria.jpg',
  content_type: 'image/jpg'
)

listing5.image.attach(
  io: File.open(Rails.root.join('app/assets/images/bernie.jpg')),
  filename: 'bernie.jpg',
  content_type: 'image/jpg'
)

listing6.image.attach(
  io: File.open(Rails.root.join('app/assets/images/mitch.jpg')),
  filename: 'mitch.jpg',
  content_type: 'image/jpg'
)

listing7.image.attach(
  io: File.open(Rails.root.join('app/assets/images/nancy.jpg')),
  filename: 'nancy.jpg',
  content_type: 'image/jpg'
)

listing8.image.attach(
  io: File.open(Rails.root.join('app/assets/images/boris.jpg')),
  filename: 'boris.jpg',
  content_type: 'image/jpg'
)

listing9.image.attach(
  io: File.open(Rails.root.join('app/assets/images/justin.jpg')),
  filename: 'justin.jpg',
  content_type: 'image/jpg'
)

listing10.image.attach(
  io: File.open(Rails.root.join('app/assets/images/emmanuel.jpg')),
  filename: 'emmanuel.jpg',
  content_type: 'image/jpeg'
)

listing11.image.attach(
  io: File.open(Rails.root.join('app/assets/images/angela.jpg')),
  filename: 'angela.jpg',
  content_type: 'image/jpg'
)

listing12.image.attach(
  io: File.open(Rails.root.join('app/assets/images/narendra.jpg')),
  filename: 'narendra.jpg',
  content_type: 'image/jpg'
)

listing13.image.attach(
  io: File.open(Rails.root.join('app/assets/images/jacinda.jpg')),
  filename: 'jacinda.jpg',
  content_type: 'image/jpg'
)

listing14.image.attach(
  io: File.open(Rails.root.join('app/assets/images/volodymyr.jpg')),
  filename: 'volodymyr.jpg',
  content_type: 'image/jpg'
)

listing15.image.attach(
  io: File.open(Rails.root.join('app/assets/images/olaf.jpg')),
  filename: 'olaf.jpg',
  content_type: 'image/jpg'
)

# Create bookings
puts "Creating bookings..."
booking1 = Booking.create!(
  date_start: DateTime.now + 10.days + 14.hours,
  date_end: DateTime.now + 10.days + 16.hours,
  user: user1,  # Alice
  listing: listing1,
  status: "pending"  # You might need to add this column if not already present
)

booking2 = Booking.create!(
  date_start: DateTime.now + 15.days + 10.hours,
  date_end: DateTime.now + 15.days + 12.hours,
  user: user2,  # Bob
  listing: listing2,
  status: "confirmed"  # You might need to add this column if not already present
)

booking3 = Booking.create!(
  date_start: DateTime.now + 20.days + 15.hours,
  date_end: DateTime.now + 20.days + 17.hours,
  user: user1,  # Alice
  listing: listing3,
  status: "pending"  # You might need to add this column if not already present
)

puts "Finished seeding!"
puts "Created #{User.count} users"
puts "Created #{Listing.count} listings"
puts "Created #{Booking.count} bookings"
