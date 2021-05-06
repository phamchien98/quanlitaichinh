class Activity < ApplicationRecord
  enum status: {come: 1, out: 0}

  belongs_to :user

  validates :time, presence: true
  validates :money, presence: true, numericality: {greater_than: 0}
  validates :note, presence: true
end
