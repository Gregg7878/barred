require "test_helper"

class TicketTest < ActiveSupport::TestCase
  test 'should not save ticket without ticket_type' do
    ticket = Ticket.new
    assert_not ticket.save, 'Saved the ticket without a ticket_type'
  end
end
