class Organizer < ApplicationRecord
    has_secure_password 

    validates :email, presence: true, uniqueness: true 
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :first_name, presence: true
    validates :last_name, presence: true
end
