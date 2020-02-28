FactoryBot.define do
  factory :activity do
    kind { [
      'walking',
      'running',
      'cycling',
      'exercise',
      'swimming',
    ].sample }
    amount { Faker::Number.between(from: 1, to: 10000) }
    user_id { nil }
  end
end
