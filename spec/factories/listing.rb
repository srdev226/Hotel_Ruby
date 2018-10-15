FactoryBot.define do
  factory :listing do
    user
    price 207
    hotel 'Hilton Garden Inn'
    bookingengine 'Expedia'
    check_in { Time.zone.today }
    check_out { Time.zone.today + 1.day }
    purchased false

    trait :confirmed do
      confirmed_at { Time.zone.now + 1.month }
    end

    trait :switched do
      switched_at { 1.month.ago }
    end
  end
end
