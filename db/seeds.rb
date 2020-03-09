# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Kelvin Liang',
             sex: 'male',
             age: 42)

User.create!(name: 'Gregoire Vella',
             sex: 'male',
             age: 36)

User.create!(name: 'Michael Hartl',
             sex: 'male',
             age: 46)

User.all.each do |user|
  user_id = user.id
  8.times do
    activities_units = {
      "walking": 500,
      "running": 1,
      "cycling": 5,
      "exercise": 5,
      "swimming": 50
    }

    kind = activities_units.keys.sample
    amount = activities_units[kind] * rand(1..10)
    created_at = Faker::Time.between_dates(from: DateTime.now - 6, to: DateTime.now, period: :all, format: :default)

    Activity.create!(
      kind: kind,
      amount: amount,
      user_id: user_id,
      created_at: created_at,
      updated_at: created_at
    )
  end
end
