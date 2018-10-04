class ConferenceRoom < ApplicationRecord
  has_many :bookings
  has_many :users, :through => :bookings
  has_and_belongs_to_many :facilities
end
