# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = FactoryGirl.create(:category)
cat2 = FactoryGirl.create(:category)
cat3 = FactoryGirl.create(:category)

problem1 = FactoryGirl.create(:problem, subcategory_id: cat1.subcategories.first.id.to_s)
problem2 = FactoryGirl.create(:problem, subcategory_id: cat1.subcategories.first.id.to_s)


problem3 = FactoryGirl.create(:problem, subcategory_id: cat1.subcategories.last.id.to_s)
problem4 = FactoryGirl.create(:problem, subcategory_id: cat1.subcategories.last.id.to_s)
problem41 = FactoryGirl.create(:problem, subcategory_id: cat1.subcategories.last.id.to_s)




problem5 = FactoryGirl.create(:problem, subcategory_id: cat2.subcategories.first.id.to_s)
problem6 = FactoryGirl.create(:problem, subcategory_id: cat2.subcategories.first.id.to_s)
problem7 = FactoryGirl.create(:problem, subcategory_id: cat2.subcategories.first.id.to_s)
problem8 = FactoryGirl.create(:problem, subcategory_id: cat2.subcategories.first.id.to_s)
problem8 = FactoryGirl.create(:problem, subcategory_id: cat2.subcategories.last.id.to_s)