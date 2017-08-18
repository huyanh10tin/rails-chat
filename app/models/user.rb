class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  has_secure_password

  def titleize_name
    name.titleize if name
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def self.from_omniauth(auth)
    # Check out the Auth Hash function at https://github.com/mkdynamic/omniauth-facebook#auth-hash
    # and figure out how to get email for this user.
    # Note that Facebook sometimes does not return email,
    # in that case you can use facebook-id@facebook.com as a workaround
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    user = where(email: email).first_or_initialize
    user.image_url = auth[:info][:image]
    user.name = auth[:info][:name]
    user.password = SecureRandom.hex
    user.save && user
  end

  def image_url_or_default
    avatar.url || image_url.presence || "http://lorempixel.com/128/128/sports/Fake-User/"
  end

  def is_friend?(user)
    friends.include?(user)
  end

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}&nat=US"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      hash[:image_url] = person["location"]["state"]
      hash[:image_url] = person["location"]["city"]
      User.create! hash
    end
  end

  def friends
    fs = friendships.select {|fs| fs.status == "accepted"}
    fs.map {|fs| User.find(fs.friend_id) }
  end

  def received_requests
    friendships.where(status: nil).map {|fs| User.find(fs.friend_id)}
  end

  def friend_names
    friends.map{|e| e.name}
  end

  def sent_requests
    friends = friendships.map {|e| (e.user_id == id && e.status == "pending") ? e : next}
    friends.delete(nil)
    friends.map { |friend| User.find(friend[:friend_id]) }
  end

  def self.recipient_options(user)
    user.friends.map{|e| [e.titleize_name, e.id]}
  end

  def like_id(id, post)
    like = post.likes.where(user_id: id)[0]
  end

  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy
    else
      likes.where(item: item).create!
    end
  end

  def liking?(item)
    likes.where(item: item).exists?
  end
end
