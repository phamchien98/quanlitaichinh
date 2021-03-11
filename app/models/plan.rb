class Plan < ApplicationRecord
  belongs_to :user
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :plan_money_come, presence: true, numericality: {greater_than: 0}
  validates :plan_money_out, presence: true, numericality: {greater_than: 0}
end
