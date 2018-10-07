class   CancellationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(booking_id)
    booking = Booking.find(booking_id)
    user = booking.user
    BookingMailer.booking_cancellation(booking, user).deliver
  end
end
