class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    @vehicles = Vehicle.all
    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { vehicle: vehicle }),
      }
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save!
      redirect_to vehicles_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
    @dates_booked = @vehicle.bookings.map(&:date)
  end

  def edit; end

  def update
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle.destroy
    redirect_to dashboard_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :details, :price, :vehicle_type, :photo, :street, :city, :zipcode, :street_number, :available, :photo)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
