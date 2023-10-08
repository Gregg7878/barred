class CalendarEventsController < ApplicationController
    before_action :authenticate_user

    # Display a list of calendar events for the current user
    def index
        @calendar_events = current_user.calendar_events
    end
end
