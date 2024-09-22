class CustomFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_custom_field, only: [:show, :update, :destroy]

  # GET /custom_fields
  def index
    @custom_fields = current_user.custom_fields

    render json: @custom_fields
  end

  # GET /custom_fields/:id
  def show
    render json: @custom_field
  end

  # POST /custom_fields
  def create
    @custom_field = current_user.custom_fields.build(custom_field_params)

    if @custom_field.save
      render json: @custom_field, status: :created, location: @custom_field
    else
      render json: @custom_field.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /custom_fields/:id
  def update
    if @custom_field.update(custom_field_params)
      render json: @custom_field, status: :ok
    else
      render json: @custom_field.errors, status: :unprocessable_entity
    end
  end

  # DELETE /custom_fields/:id
  def destroy
    @custom_field.destroy
    head :no_content
  end

  private

  def set_custom_field
    @custom_field = current_user.custom_fields.find_by!(custom_field_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'CustomField not found' }, status: :not_found
  end

  def custom_field_params
    params.require(:custom_field).permit(:entity_type, :entity_id, :field_name, :field_value)
  end
end
