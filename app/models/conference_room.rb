class ConferenceRoom < ApplicationRecord
  has_many :bookings
  has_many :users, :through => :bookings
  has_and_belongs_to_many :facilities

  validates :room_no, :capacity, :area, presence: true

  def self.search(facility_ids)
    ConferenceRoom.joins(:facilities).where(id: facility_ids).uniq
  end
end
