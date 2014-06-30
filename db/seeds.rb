require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: "helloworld"
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Lists
20.times do
  List.create(
    user: users.sample,
    title:  Faker::Lorem.sentence
  )
end
lists = List.all

# Create Items
100.times do
 item = Item.create(
    list: lists.sample,
    name: Faker::Lorem.sentence
  )
  item.update_attribute(:created_at, rand(10.minutes .. 6.days).ago)

end

member = User.new(
  name:     'Mr Test',
  email:    'mrtest@mailinator.com
',
  password: 'password',
)
member.skip_confirmation!
member.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} list created"
puts "#{Item.count} items created"