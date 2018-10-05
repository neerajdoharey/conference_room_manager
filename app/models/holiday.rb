class Holiday < ApplicationRecord
  validates :name,:holiday_date, presence: true
end
