class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm_booking, :reject_booking, :cancel_booking]
  before_action :set_republica, only: [:show, :edit, :confirm_booking, :reject_booking]
  before_action :find_republica, only: [:new, :create, :index, :update, :destroy]

  def index
    @bookings = @republica.bookings

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
    @booking.status = "P"
    @booking.update(booking_params)
    redirect_to user_booking_list_path(@booking.id, @booking.republica_id), notice: 'Booking was successfully updated.'

  end

  def cancel_booking
    @booking.update_attributes(status: "C")
    redirect_to user_booking_list_path(@booking.id, @booking.republica_id), notice: 'Booking was successfully cancelated.'
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

  def confirm_booking
    if @republica.vacancies == 0
      redirect_to republica_bookings_path(@booking.republica_id), notice: 'No bed available.'
    end

    @booking.republica.vacancies -= 1
    @republica.save
    @booking.status = "A"
    @booking.save
    redirect_to republica_bookings_path(@booking.republica_id), notice: 'Booking acceped.'
  end

  def reject_booking
    if @booking.status == "A"
      @booking.republica.vacancies += 1
      @republica.save
    end

    @booking.status = "R"
    @booking.save
    redirect_to republica_bookings_path(@booking.republica_id), notice: 'Booking Rejected.'
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
