class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :date_before_start
  validate :start_end_check
  
  def date_before_start
    return if end_at.blank?
    errors.add(:end_at, "は今日以降のものを選択して下さい。") if end_at < Date.today + 1
  end 
  
  def start_end_check
    return if end_at.blank? || start_at.blank?
    errors.add(:end_at, "の日付を正しく記入して下さい。") if end_at < start_at
  end 
  
end
