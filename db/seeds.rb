# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# This seed file will create sample data for the Users, Listings, and Bookings tables

# Ensure the database is cleared first to avoid duplicate entries
User.destroy_all
Listing.destroy_all
Booking.destroy_all

# Create sample users
users = User.create!([
  {
    email: 'john@example.com',
    password: 'password123',
    name: 'John Doe'
  },
  {
    email: 'jane@example.com',
    password: 'password456',
    name: 'Jane Smith'
  },
  {
    email: 'mike@example.com',
    password: 'password789',
    name: 'Mike Johnson'
  }
])

# Create sample listings
listings = Listing.create!([
  {
    name: 'Nelson Mandela',
    type: 'Speach in a stadium',
    price: 150.00,
    location: 'Joahnnesburg, South Africa',
    availability_start: Date.today,
    availability_end: Date.today + 30.days,
    picture:,
    user: users[0]
  },
  {
    name: 'Mahatma Gandhi',
    type: 'Peaceful protest',
    price: 300.00,
    location: 'New Delhi, India',
    availability_start: Date.today,
    availability_end: Date.today + 45.days,
    picture:,
    user: users[1]
  },
  {
    name: 'Martin Luther King Jr.',
    type: 'March on Washington',
    price: 200.00,
    location: 'Atlanta, Georgia',
    availability_start: Date.today,
    availability_end: Date.today + 60.days,
    picture:,
    user: users[2]
  }
])

# Create sample bookings
Booking.create!([
  {
    date_start: Date.today + 7.days,
    date_end: Date.today + 10.days,
    user: users[1],
    listing: listings[0]
  },
  {
    date_start: Date.today + 15.days,
    date_end: Date.today + 20.days,
    user: users[2],
    listing: listings[1]
  },
  {
    date_start: Date.today + 25.days,
    date_end: Date.today + 30.days,
    user: users[0],
    listing: listings[2]
  }
])

puts "Seed data created successfully!"
