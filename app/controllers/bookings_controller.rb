class BookingsController < ApplicationController
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
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

#   def edit
#     @user = User.find(params[:user_id])
#     @booking = Booking.new
#   end

  def update
    set_booking
    @booking.accepted = true
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to bookings_path
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
