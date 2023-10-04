class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'User_id'
  has_many :tickets
  has_and_belongs_to_many :categories, join_table: :events_categories

  validates :title, presence: true
  validates :date, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_in_future

  def start_date_in_future
    errors.add(:start_date, "must be in the future") if date.present? && date < Date.today
  end


end
