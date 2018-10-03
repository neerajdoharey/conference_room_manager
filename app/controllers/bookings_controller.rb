class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:edit, :update, :cancel]
  def index
    @bookings = Booking.includes(:conference_room, :user).order( 'booking_date DESC' ).page(params[:page]).per(15)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = check_booking
    if @booking.save
      flash[:success] = "Booking Created Successfully"
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:success] = "Booking update"
      redirect_to booking_path(booking)
    else
      render 'edit'
    end
  end

  def show
  end

  def cancel
    @booking.status = "cancelled"
    @booking.save
    reallocate_room
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :conference_room_id, :booking_date, :start_time, :end_time, :position, :description)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def check_booking
    start_time = "#{params[:booking]['start_time(4i)']}:#{params[:booking]['start_time(5i)']}"
    end_time = "#{params[:booking]['end_time(4i)']}:#{params[:booking]['end_time(5i)']}"
    bookings = Booking.joins(:conference_room).where(conference_rooms: {id: params[:booking][:conference_room_id]}, bookings:{booking_date: params[:booking][:booking_date], status:"confirm"}).order( 'bookings.start_time')
    status =  bookings.any?{|apt| start_time < apt.end_time.strftime("%H:%M") && apt.start_time.strftime("%H:%M") < end_time} ? "waiting" : "confirm"
    return status
  end

  def reallocate_room
    waiting_bookings = Booking.where(conference_room_id:@booking.conference_room_id, booking_date:@booking.booking_date, status:"waiting")
    waiting_bookings.each do |booking|
      bookings = Booking.joins(:conference_room).where(conference_rooms: {id:@booking.conference_room_id}, bookings:{booking_date:@booking.booking_date , status:"confirm"}).order( 'bookings.start_time')

      unless bookings.any?{ |b| b.start_time.strftime("%H:%M") < booking.end_time.strftime("%H:%M") && booking.start_time.strftime("%H:%M") < b.end_time.strftime("%H:%M")}
        booking.status = "confirm"
        booking.save
        #booking.status = "confirm" unless bookings.any?{|apt| start_time < apt.end_time.strftime("%H:%M") && apt.start_time.strftime("%H:%M") < end_time}
      end
    end
    puts waiting_bookings.size
  end
end
