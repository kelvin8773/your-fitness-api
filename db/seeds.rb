# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Kelvin Leung',
             sex: 'male',
             age: 32)

User.create!(name: 'Gregoire Vella',
             sex: 'male',
             age: 36)

User.create!(name: 'Michael Hartl',
             sex: 'male',
             age: 46)
