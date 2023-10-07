# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying existing data..."
Organizer.destroy_all 
Customer.destroy_all
puts "🌱 Seeding data..." 
organizer = Organizer.create(email: "alex@test.com",first_name: "Alex",last_name: "Kimanthi",password: "Pass@123",age: 47)


customer1 = Customer.create(email:"kwachira@test.com",password: "Pass@123",first_name: "Kenneth",last_name: "Wachira",age: 26)
customer2 = Customer.create(email:"smumbi@test.com",password: "Pass@123",first_name: "Sylvia",last_name: "Mumbi",age: 24)
customer3 = Customer.create(email:"dnjeri@test.com",password: "Pass@123",first_name: "Damaris",last_name: "Njeri",age: 25)







puts "✅ Done seeding!"