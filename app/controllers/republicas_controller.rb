class RepublicasController < ApplicationController
  before_action :find_republica, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(current_user)
    @republicas = @user.republicas
    # Republica.where(city: params[:city])
    @republicas = Republica.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@republicas) do |republica, marker|
      marker.lat republica.latitude
      marker.lng republica.longitude
      # marker.infowindow render_to_string(partial: "/republicas/map_box", locals: { flat: flat })
    end

  end

  def show
    @republica_coordinates = { lat: @republica.latitude, lng: @republica.longitude }
    @hash = Gmaps4rails.build_markers(@republica) do |republica, marker|
      marker.lat republica.latitude
      marker.lng republica.longitude
      # marker.infowindow render_to_string(partial: "/republicas/map_box", locals: { flat: flat })
    end
    @bookings = @republica.bookings
  end

  def new
    @republica = Republica.new
  end

  def create
    @republica = Republica.new(republica_params)
    @republica.user = current_user
    if @republica.save
      redirect_to republica_path(@republica)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @republica.update(republica_params)
    redirect_to republica_path(@republica)
  end

  def destroy
    @republica.destroy
    redirect_to republicas_path
  end

private

  def find_republica
    @republica = Republica.find(params[:id])
  end

  def republica_params
    params.require(:republica).permit(:name, :address, :description, :vacancies, :city, photos: [])
  end
end

