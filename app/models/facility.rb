class Facility < ApplicationRecord
  has_and_belongs_to_many :conference_rooms
  validates :facility_name, presence: true
end
