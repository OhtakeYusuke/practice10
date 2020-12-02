FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    age {rand(120)}
    profile {Faker::Lorem.paragraph}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
  end
end
