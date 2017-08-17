class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :item, dependent: :destroy

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end

  def comments_count
    comments.count > 2 ? " Comments #{comments.count}" : " Comment"
  end

  def likes_partial
    return if likes.count == 0

    if likes.count == 1
      person = likes.first.user
      get_link(person) + "&nbsp likes this post"
    elsif likes.count == 2
      users = likes.map {|e| e.user}
      get_link(users[0]) + "&nbsp & &nbsp" + get_link(users[1]) + "&nbsp like this post."
    elsif likes.count >= 3
      users = likes.map {|e| e.user}
      get_link(users[0]) + ", &nbsp" + get_link(users[1]) + ", &nbsp" + get_link(users[3]) + "&nbsp & &nbsp" + (likes.count - 3).to_s + "&nbsp others like this post"
    end
  end

  def get_link(user)
    "<a href='/users/#{user.id}/profile'>#{user.titleize_name}</a>"
  end

  def has_likes
    likes.count > 0
  end

  def has_no_comments?
    comments.count == 0 ? 'hidden-comment' : ''
  end

  self.per_page = 3
end
