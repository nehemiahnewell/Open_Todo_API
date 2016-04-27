require 'random_data'

5.times do 
  User.create!(
    username: RandomData.random_word,
    password: RandomData.random_word
    )
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

admin = User.create!(
   username:     'admin',
   password: 'helloworld',
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"