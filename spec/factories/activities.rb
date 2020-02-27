FactoryBot.define do
  factory :activity do
    type { [
      'walking',
      'running',
      'cycling',
      'exercise',
      'swimming',
    ].sample }
    amount {Faker::Number.between(from: 1, to: 8000)}
    user_id nil
  end
end