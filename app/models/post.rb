class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  scope :recent_post, -> { order(created_at: :desc) }
end
