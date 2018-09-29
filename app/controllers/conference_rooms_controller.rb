class ConferenceRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conference_room, only: [:destroy, :show, :edit, :update]

  def index
    @conference_rooms = ConferenceRoom.all
  end

  def new
    @conference_room = ConferenceRoom.new
    @units = units
  end

  def create
    @conference_room = ConferenceRoom.new(conference_room_params)
    if @conference_room.save
      flash[:success] = "Conference room created Successfully"
      redirect_to conference_rooms_path
    else
      render 'new'
    end
  end

  def edit
    @units = units
  end

  def update
    if @conference_room.update(conference_room_params)
      flash[:success] = "Standard was Successfully updated..."
      redirect_to conference_room_path(@conference_room)
    else
      render 'edit'
    end
  end

  def show
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
