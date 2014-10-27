# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(role: "Supervisor", email:"admin1@example.com", password: "secrets!", first_name:"Super", last_name: "Visor")
User.create(role: "Health Worker", email:"chw1@example.com", password: "secrets!", first_name:"Health", last_name: "Worker")
User.create(role: "Research Assistant", email:"ra1@example.com", password: "secrets!", first_name:"Research", last_name: "Assistant")
