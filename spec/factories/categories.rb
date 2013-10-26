# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title Faker::Name.name
    image Faker::Internet.url
    subcategories { [FactoryGirl.build(:subcategory), FactoryGirl.build(:subcategory)] }
  end
end
