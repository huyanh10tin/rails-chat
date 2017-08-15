# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = (2..52).to_a

users.each do |f|
  Friendship.create user_id: 1, friend_id: f
  Friendship.create user_id: f, friend_id: 1
end

users.each do |user|
  a = Post.create(user_id: user, body: (Faker::Lorem.paragraph(3, true, 10)))
  Random.rand(1..10).times do |f|
    a.likes.build(user_id: 2).save
  end
end
