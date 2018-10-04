class FacilitiesController < ApplicationController
before_action :set_facility, only: [:edit, :show, :update, :destroy]
  def index
    @facilities = Facility.all.page(params[:page]).per(10)

  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      flash[:success] = "Facility Successfully created"
      redirect_to facilities_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @facility.update(facility_params)
      flash[:success] = "Facility was Successfully updated..."
      redirect_to facility_path(@facility)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @facility.destroy
    flash[:danger] = "Facility was Successfully Deleted..."
    redirect_to facilities_path

  end
  private
  def facility_params
    params.require(:facility).permit(:facility_name)
  end

  def set_facility
    @facility = Facility.find(params[:id])
  end

end
