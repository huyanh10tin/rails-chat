class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :item, dependent: :destroy
  has_many :photos, as: :attachment, dependent: :destroy
  has_many :mentions, dependent: :destroy

  paginates_per 5

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end

  def comments_count
    comments.count > 2 ? "#{comments.count} Comments " : " Comment"
  end

  def likes_partial
    return if likes.count == 0

    if likes.count == 1
      person = likes.first.user
      get_link(person) + "&nbsp likes this post"
    elsif likes.count == 2
      users = likes.map {|e| e.user}
      get_link(users.first) + "&nbsp & &nbsp" + get_link(users.second) + "&nbsp like this post."
    elsif likes.count >= 3
      users = likes.map {|e| e.user}
      get_link(users.first) + ", &nbsp" + get_link(users.second) + ", &nbsp" + get_link(users.third) + "&nbsp & &nbsp" + (likes.count - 3).to_s + "&nbsp others like this post"
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

  def belongs_to?(user)
    user_id == user.id
  end
end
