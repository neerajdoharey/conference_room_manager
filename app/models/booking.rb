class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :conference_room

  validate :check_holiday, :check_current_day, :check_start_end_time,:check_weekend
  validates :booking_date,:description, presence:true

  def check_current_day
    if booking_date < Date.today
      errors.add(:booking_date ,"Not less then today ")
    end
  end

  def check_start_end_time
    if start_time == end_time || start_time > end_time
      errors.add(:booking_date ,"Start time cant be equal or greater then End time")
    end
  end

  def check_holiday
    holiday = Holiday.find_by_holiday_date(booking_date)
    if holiday.present?
      errors.add(:booking_date ,"Holiday ")
    end
  end

  def check_weekend
    errors.add(:booking_date,"Can't book on weekend")if booking_date.on_weekend?
  end
end
