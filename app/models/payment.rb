class Payment < ApplicationRecord
  belongs_to :ticket

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_id, uniqueness: true
  validates :status, inclusion: { in: ['pending', 'completed', 'failed'] }
end
