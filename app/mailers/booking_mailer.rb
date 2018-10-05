class BookingMailer < ApplicationMailer
  def booking_confirmation(booking, user)
    @user = user
    @booking = booking
    mail to: @user.email, subject: "Booking Confirmation", from: "neerajlivewire@gmail.com"
  end

  def booking_cancellation(booking, user)
    @user = user
    @booking = booking
    mail to: @user.email, subject: "Booking Cancellation", from: "neerajlivewire@gmail.com"
  end
end
