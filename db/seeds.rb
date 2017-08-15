# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "Loi Tran", email: "loi@coderschool.vn", password: "asdf", state: "Florida", city: "Tallahassee"

def generate_users(n = 5, gender = "female")
  url = "https://randomuser.me/api?results=#{n}&gender=#{gender}&nat=US"
  body = HTTP.get(url).parse
  body["results"].each do |person|
    hash = {}
    hash[:name] = person["name"]["first"].capitalize + " " + person["name"]["last"].capitalize
    hash[:email] = person["email"]
    hash[:password] = person["login"]["password"]
    hash[:image_url] = person["picture"]["large"]
    hash[:state] = person["location"]["state"].capitalize
    hash[:city] = person["location"]["city"].capitalize
    User.create! hash
  end
end

generate_users(51)
users = (2..51).to_a

users.each do |f|
  puts "Generating Friendships"
  Friendship.create! user_id: 1, friend_id: f
  Friendship.create! user_id: f, friend_id: 1
end

users.each do |user|
  puts "Generating posts"
  a = Post.create(user_id: user, body: (Faker::Lorem.paragraph(3, true, 10)))
  time = Random.rand(1..100)
  a.created_at = time.hours.ago
  a.save
  Random.rand(1..30).times do |f|
    a.likes.build(user_id: 2).save
  end
end
