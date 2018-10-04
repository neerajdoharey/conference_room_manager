class ConferenceRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conference_room, only: [:destroy, :show, :edit, :update]

  def index
    @conference_rooms = ConferenceRoom.order(:room_no).page(params[:page]).per(10)
  end

  def new
    @conference_room = ConferenceRoom.new
    @units = units
    @facilities = Facility.all
  end

  def create
    @conference_room = ConferenceRoom.new(conference_room_params)
    if @conference_room.save
      @conference_room.facilities << Facility.where(id: params[:conference_room][:facilities] )
      flash[:success] = "Conference room created Successfully"
      redirect_to conference_rooms_path
    else
      render 'new'
    end
  end

  def edit
    @units = units
    @facilities = Facility.all
  end

  def update
    if @conference_room.update(conference_room_params)
      flash[:success] = "Room was Successfully updated..."
      redirect_to conference_room_path(@conference_room)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @conference_room.destroy
    flash[:danger] = "Conference Room was Successfully Deleted..."
    redirect_to conference_rooms_path
  end

  private
  def conference_room_params
    params.require(:conference_room).permit(:room_no, :capacity, :area, :unit)
  end

  def set_conference_room
    @conference_room = ConferenceRoom.find(params[:id])
  end

  def units
    %w[sqmeter sqfeet sqyard]
  end

end
