# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do 
  User.create!
end
users = User.all

50.times do
  List.create!
  {
    user: users.sample 
  }
end
lists = List.all

500.times do
  Item.create!
  {
    list: lists.sample
  }
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"