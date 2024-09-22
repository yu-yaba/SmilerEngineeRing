class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = current_user.events

    render json: @events, include: :custom_fields
  end

  # GET /events/:id
  def show
    render json: @event, include: :custom_fields
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/:id
  def update
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = current_user.events.find_by!(event_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Event not found' }, status: :not_found
  end

  def event_params
    params.require(:event).permit(:name, :event_date, :description, :url, :image)
  end
end
