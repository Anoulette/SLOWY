class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    set_booking
    @vehicle = @booking.vehicle
  end

#   def new
#     @vehicle = Vehicle.find(params[:vehicle_id])
#     @booking = Booking.new
#   end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(bookings_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render "vehicles/show", status: :unprocessable_entity, notice: "Choisir"
    end
  end

  # def edit
  #   @booking = Booking.new
  #   @vehicle = Vehicle.find(params[:vehicle_id])
  # end

  # def update
  #   set_booking
  #   @vehicle = Vehicle.find(params[:vehicle_id])
  #   @booking.vehicle = @vehicle
  #   @booking.update(bookings_params)
  #   # @booking.accepted = true
  #   @booking.save!
  #   redirect_to dashboard_path
  # end

  def destroy
    set_booking
    @bookings.destroy
    redirect_to dashboard_path
  end

  def dashboard
    @vehicles = Vehicle.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def set_booking
    @bookings = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:date, :comment, :accepted)
  end
end
