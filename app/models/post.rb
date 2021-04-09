class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :recent_post, -> {order created_at: :desc}

  def is_belongs_to? user
    user_id == user.id
  end

  def is_liked? user
    liked_by_user(user).present?
  end

  def liked_by_user user
    likes.select { |like| like.user_id == user.id }
  end

  def likes_sort_by_created_at
    likes.sort { |a, b| b.created_at <=> a.created_at }
  end
end
