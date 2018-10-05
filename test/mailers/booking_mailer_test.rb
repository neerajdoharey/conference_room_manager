require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test "booking_confirmation" do
    mail = BookingMailer.booking_confirmation
    assert_equal "Booking confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_cancellation" do
    mail = BookingMailer.booking_cancellation
    assert_equal "Booking cancellation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
