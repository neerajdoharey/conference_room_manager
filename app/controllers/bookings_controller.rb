class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:edit, :update]
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.position = check_booking(params[:booking_date] ,params[:start_time], params[:end_time], params[:conference_room_id])

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

  private
  def booking_params
    params.require(:booking).permit(:user_id, :conference_room_id, :booking_date, :start_time, :end_time, :position, :description)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def check_booking(booking_date, start_time, end_time, room_id)
    b = Booking.joins(:conference_room).where(conference_rooms: {room_no: '2'}, bookings:{booking_date: "2018-10-03 00:00:00"}) 
  end
end
