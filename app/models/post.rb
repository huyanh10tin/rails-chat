class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  end
end
