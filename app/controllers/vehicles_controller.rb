class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  # def new
  #   @vehicle = Vehicle.new
  # end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.save
    redirect_to vehicle_path(@vehicle)
  end

  def show; end

  # def edit; end

  def update

    @vehicle.update(params[:vehicle])
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :details, :price, :vehicle_type, :photo, :street, :city, :zipcode, :street_number, :available)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
