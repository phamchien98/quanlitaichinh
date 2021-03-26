class Plan < ApplicationRecord
  belongs_to :user
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :plan_money_come, presence: true, numericality: {greater_than: 0}
  validates :plan_money_out, presence: true, numericality: {greater_than: 0}
  validate :end_after_start

  private

  def end_after_start
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "Must be after the start date")
    end
  end
end
