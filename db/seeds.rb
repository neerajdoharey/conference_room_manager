# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
#Roles
Role.find_or_create_by(id: 1, name: "super_manager")
Role.find_or_create_by(id: 2, name: "manager")
Role.find_or_create_by(id: 3, name: "client")
Role.find_or_create_by(id: 4, name: "guest")

User.find_or_create_by({
  id: 1
  email: "sadmin@admin.com",
  password: "sadmin",
  first_name: "SuperAdmin",
  last_name: "User",
})

user = User.find(1)
user.roles << Role.find(1)

User.find_or_create_by({
  id: 1
  email: "admin@admin.com",
  password: "admin",
  first_name: "Admin",
  last_name: "User",
})

user = User.find(2)
user.roles << Role.find(2)

Facility.find_or_create_by(id: 1, facility_name: "Air conditioner")
Facility.find_or_create_by(id: 2, facility_name: "Non Air conditioner")
Facility.find_or_create_by(id: 3, facility_name: "Television")
Facility.find_or_create_by(id: 4, facility_name: "Projector")
