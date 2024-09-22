class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    @people = current_user.people

    render json: @people, include: :custom_fields
  end

  # GET /people/:id
  def show
    render json: @person, include: :custom_fields
  end

  # POST /people
  def create
    @person = current_user.people.build(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/:id
  def update
    if @person.update(person_params)
      render json: @person, status: :ok
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/:id
  def destroy
    @person.destroy
    head :no_content
  end

  private

  def set_person
    @person = current_user.people.find_by!(person_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Person not found' }, status: :not_found
  end

  def person_params
    params.require(:person).permit(:name, :phone_number, :email, :address, :organization, :met_date, :notes, :url, :image)
  end
end
