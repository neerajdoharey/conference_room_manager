# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_confirmation
  def booking_confirmation
    BookingMailer.booking_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_cancellation
  def booking_cancellation
    BookingMailer.booking_cancellation
  end

end
