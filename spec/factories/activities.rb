FactoryBot.define do
  factory :activity do
    kind do
      %w[
        walking
        running
        cycling
        exercise
        swimming
      ].sample
    end
    amount { Faker::Number.between(from: 1, to: 10_000) }
    user_id { nil }
  end
end
