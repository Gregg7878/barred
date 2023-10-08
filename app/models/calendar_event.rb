class CalendarEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :event_id, scope: :user_id, message: 'has already been added to your calendar'
end
