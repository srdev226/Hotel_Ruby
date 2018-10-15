FactoryBot.define do
  factory :room_type do
    
  end
  factory :booking_engine do
    
  end
  factory :hotel do
    
  end
  sequence :email do |n|
    "person#{SecureRandom.hex}@example.com"
  end
end
