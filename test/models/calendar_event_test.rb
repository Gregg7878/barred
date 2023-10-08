require "test_helper"

class CalendarEventTest < ActiveSupport::TestCase
  test 'should not allow adding the same event to the calendar multiple times' do
    user = users(:one)  # Replace with your fixture or create a user as needed
    event = events(:one)  # Replace with your fixture or create an event as needed

    # Create a calendar event for the same user and event
    calendar_event = CalendarEvent.new(user: user, event: event)

    # Attempt to save the calendar event
    assert_not calendar_event.save, 'Allowed adding the same event to the calendar multiple times'
  end
end
