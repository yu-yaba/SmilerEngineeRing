# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :authenticate_user! # Deviseの認証を適用
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users.as_json(
      only: [:user_id, :email, :username, :last_login, :is_active],
      include: {
        people: { only: [:person_id, :name] },
        events: { only: [:event_id, :name] },
        places: { only: [:place_id, :name] }
      }
    )
  end

  # GET /users/:id
  def show
    render json: @user.as_json(
      only: [:user_id, :email, :username, :last_login, :is_active],
      include: {
        people: { only: [:person_id, :name] },
        events: { only: [:event_id, :name] },
        places: { only: [:place_id, :name] }
      }
    )
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: @user.as_json(
        only: [:user_id, :email, :username, :last_login, :is_active]
      ), status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user.as_json(
        only: [:user_id, :email, :username, :last_login, :is_active]
      ), status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # ユーザーのセットアップ
  def set_user
    @user = User.find_by!(user_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  # 許可するパラメータ
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
