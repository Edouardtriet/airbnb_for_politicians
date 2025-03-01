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
  name: "Policy Discussion with Jane",
  type_of_event: "Meeting",  # Changed from 'type' which is a reserved word in Ruby
  price: 150.00,
  location: "New York City",
  availability_start: DateTime.now + 1.day,
  availability_end: DateTime.now + 30.days,
  picture: "https://randomuser.me/api/portraits/women/44.jpg",  # Placeholder URL
  user: user3  # Jane Politician
)

listing2 = Listing.create!(
  name: "Campaign Speech by John",
  type_of_event: "Speech",  # Changed from 'type' which is a reserved word in Ruby
  price: 500.00,
  location: "Washington DC",
  availability_start: DateTime.now + 2.days,
  availability_end: DateTime.now + 60.days,
  picture: "https://randomuser.me/api/portraits/men/32.jpg",  # Placeholder URL
  user: user4  # John Statesman
)

listing3 = Listing.create!(
  name: "Town Hall with Jane",
  type_of_event: "Town Hall",  # Changed from 'type' which is a reserved word in Ruby
  price: 300.00,
  location: "Boston",
  availability_start: DateTime.now + 5.days,
  availability_end: DateTime.now + 45.days,
  picture: "https://randomuser.me/api/portraits/women/44.jpg",  # Placeholder URL
  user: user3  # Jane Politician
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
