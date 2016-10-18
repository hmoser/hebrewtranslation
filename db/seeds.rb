# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Hannah', email: 'hmoser@brandeis.edu', password: 'maria!', admin: true)
User.create(name: 'Maria', email: 'maria@brandeis.edu', password: 'hannah!', admin: false)
User.create(name: 'Zak', email: 'zak@brandeis.edu', password: 'rick!!', admin: false)
User.create(name: 'Rick', email: 'rick@brandeis.edu', password: 'zak!!!', admin: false)