class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:show, :update, :destroy]

  # GET /links
  def index
    @links = current_user.links

    render json: @links
  end

  # GET /links/:id
  def show
    render json: @link
  end

  # POST /links
  def create
    @link = current_user.links.build(link_params)

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/:id
  def update
    if @link.update(link_params)
      render json: @link, status: :ok
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/:id
  def destroy
    @link.destroy
    head :no_content
  end

  private

  def set_link
    @link = current_user.links.find_by!(link_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Link not found' }, status: :not_found
  end

  def link_params
    params.require(:link).permit(:from_node_type, :from_node_id, :to_node_type, :to_node_id, :color)
  end
end
