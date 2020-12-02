FactoryBot.define do
  factory :post do
    title {Faker::Name.name}
    description {Faker::Lorem.paragraph}
    user
  end
end
