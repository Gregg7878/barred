class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :customer


  validates :ticket_type, presence: true, inclusion: { in: ['MVP', 'Early Booking', 'Regular'] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_date, presence: true

end
