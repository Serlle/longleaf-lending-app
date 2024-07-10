# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb
# Clear existing data
RealEstate.delete_all

# Create a single sample real estate record
real_estate = {
  address: "103 Menton St, Gordon, Georgia, 31031",
  loan_term: 12,
  purchase_price: 100000,
  repair_budget: 20000,
  arv: 150000,
  first_name: "John",
  last_name: "Connor",
  phone_number: "2248098619",
  email: "john@example.com",
  loan_amount: 90000,
  profit: 47577.077,
  created_at: Time.now,
  updated_at: Time.now
}

# Insert the sample record into the database
RealEstate.create!(real_estate)

puts "Seed data loaded successfully!"
