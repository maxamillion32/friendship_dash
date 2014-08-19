# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(role: "Researcher", email:"admin1@example.com", password: "secrets!", username: "admin1", first_name:"Jim", last_name: "Jones", pin: "12345")
chw = User.create(role: "Health Worker", email:"chw1@example.com", password: "secrets!", username: "chw1", first_name:"Jim", last_name: "Jones", pin: "12345")
Participant.create(health_worker_id: chw.id, patient_identifier: "p1", first_name:"bob", last_name: "saccomano")
