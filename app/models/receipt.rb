class Receipt < ApplicationRecord
  has_one :activity
  belongs_to :user
end
