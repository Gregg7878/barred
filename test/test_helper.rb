ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'test_helper'

class ActiveSupport::TestCase
  test 'should not save ticket without ticket_type' do
    ticket = Ticket.new
    assert_not ticket.save, 'Saved the ticket without a ticket_type'
  end
end
