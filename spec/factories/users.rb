FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 18, to: 79) }
    sex { %w[male female].sample }
  end
end
