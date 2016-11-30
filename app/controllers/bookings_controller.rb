class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_republica, only: [:show, :edit, :index]
  before_action :find_republica, only: [:new, :create, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  # GET /bookings/new
  def new
    @booking = @republica.bookings.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = @republica.bookings.new(booking_params)
    @booking.status = "P"
    @booking.user = current_user

    if @booking.save
      redirect_to user_booking_list_path(@booking.id, @booking.republica), notice: 'Booking was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to user_booking_list_path(@booking.id, @booking.republica), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
      redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  def list_users
    @user = User.find(current_user)
    @bookings = @user.bookings
  end

  private

    def find_republica
      @republica = Republica.find(params[:republica_id])

    end

    def set_republica

      @republica = @booking.republica

    end

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:check_in, :check_out, :status, :user_id, :republica_id)
    end

end
