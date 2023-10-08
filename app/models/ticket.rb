class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :customer


  validates :ticket_type, inclusion: { in: ['MVP', 'Early Booking', 'Regular'] }
end
