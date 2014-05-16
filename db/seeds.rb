# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Superuser.create(email: 'superuser@example.com', password: 'password', password_confirmation: 'password')

Employee.create(email: 'ace@example.com', password: 'password',
                password_confirmation: 'password', first_name: 'Ace', middle_name: 'Jones', last_name: "O'Base")

Event.create(title: "Code review", start: Date.parse("May 9, 2014"))

Employee.create(email: 'hr@example.com', password: 'password',
                password_confirmation: 'password', first_name: 'Human', middle_name: 'Middle', last_name: 'Resources',
                hr: true)
