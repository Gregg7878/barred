class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :customer


  validates :ticket_type, inclusion: { in: ['MVP', 'Early Booking', 'Regular'] }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
end
