class HolidaysController < ApplicationController
  load_and_authorize_resource
  before_action :set_holiday, only: [:edit, :show, :update, :destroy]
  def index
    @holidays = Holiday.all.page(params[:page]).per(5)

  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save
      flash[:success] = "Holiday Successfully created"
      redirect_to holidays_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @holiday.update(holiday_params)
      flash[:success] = "Holiday was Successfully updated..."
      redirect_to holiday_path(@holiday)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @holiday.destroy
    flash[:danger] = "Holiday was Successfully Deleted..."
    redirect_to holidays_path

  end
  private
  def holiday_params
    params.require(:holiday).permit(:name, :holiday_date)
  end

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end
end
