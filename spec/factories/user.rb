FactoryBot.define do
  factory :user do
    first_name 'Person'
    last_name 'Example'
    email
    phone_number '123 456 7890'
    password 'HelloWorld123'
  end
end
