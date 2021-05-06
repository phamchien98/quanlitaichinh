class Receipt < ApplicationRecord
  has_one_attached :image
  has_one :activity
  belongs_to :user
end
