class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  def index
    @places = current_user.places

    render json: @places, include: :custom_fields
  end

  # GET /places/:id
  def show
    render json: @place, include: :custom_fields
  end

  # POST /places
  def create
    @place = current_user.places.build(place_params)

    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/:id
  def update
    if @place.update(place_params)
      render json: @place, status: :ok
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/:id
  def destroy
    @place.destroy
    head :no_content
  end

  private

  def set_place
    @place = current_user.places.find_by!(place_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Place not found' }, status: :not_found
  end

  def place_params
    params.require(:place).permit(:name, :address, :visited_date, :description, :url, :image)
  end
end
