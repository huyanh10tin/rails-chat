# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
me = User.create!(
  name: "Loi Tran",
  email: "loi@coderschool.vn",
  password: "asdf",
  state: "Florida",
  city: "Tallahassee",
  position: "Getting Yelled at",
  school: "Florida State University",
  quote: "If it was easy, everyone would do it.")

me.image_url = "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-1/p320x320/14633014_10154745913714359_6100717154322258576_n.jpg?oh=68aa05d842d0ee27ae6dc66b0ac4fb41&oe=5A27BEE1"
me.save!

def generate_users(n = 5, gender = "female")
  puts "generating users"

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
    hash[:position] = Faker::Job.title
    hash[:school] = Faker::University.name
    hash[:quote] = Faker::Movie.quote
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
  puts "Generating posts for user"
  # Number of posts per user
  Random.rand(1..5).times do
    post = Post.create(user_id: user, body: (Faker::Lorem.paragraph(3, true, 30)))
    time = Random.rand(1..1000)
    post.created_at = time.hours.ago

    # Number of comments per post
    Random.rand(1..10).times do |f|
      puts "Generating comments for post"
      person = Random.rand(1..50)
      comment = post.comments.build(user_id: person, body: Faker::Lorem.paragraph(1, true, 3))
      comment.save
      random_boolean = [true, false , false].sample

      if random_boolean
        Random.rand(3..15).times do
          puts "Generating likes for comments"
          like = comment.likes.build(user_id: Random.rand(2..49))
          like.save
        end
      end
    end


    # Number of likes per post
    Random.rand(1..30).times do |f|
      puts "Generating likes for post"
      person = Random.rand(1..50)
      post.likes.build(user_id: person).save
    end

    post.save
  end
end
