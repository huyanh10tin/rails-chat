class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :item, dependent: :destroy

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end

  self.per_page = 3
end
