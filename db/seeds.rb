require 'random_data'

5.times do 
  User.create!(
    username: RandomData.random_word,
    password: RandomData.random_word
    )
end
users = User.all

25.times do
  List.create!(
    user: users.sample,
    name: RandomData.random_word,
    permissions: "private"
  )
end
25.times do
  List.create!(
    user: users.sample,
    name: RandomData.random_word,
    permissions: "public"
  )
end
lists = List.all

500.times do
  Item.create!(
    list: lists.sample,
    description: RandomData.random_word
  )
end

admin = User.create!(
   username: 'admin',
   password: 'helloworld',
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
puts "Admin account #{admin.username} password #{admin.password}"