# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem do
    title Faker::Name.name
    status 'new'
    address Faker::Address.street_address(include_secondary = false)
    location ({lat: Faker::Address.longitude, lng: Faker::Address.latitude})
    subcategory_id Faker::Number.digit
    description Faker::Lorem.sentence(10)
  end
end
