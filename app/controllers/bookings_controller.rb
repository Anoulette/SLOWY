class BookingsController < ApplicationController

  def index; end
  @user = User.find(params[:user_id])
  @


  def show; end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(bookings_params)
    @booking.vehicle = @vehicle
    if @booking.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def update
    @booking = Booking.update(bookings_params)
  end

  def destroy
    @booking.destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:date, :comment, :accepted)
  end
end
