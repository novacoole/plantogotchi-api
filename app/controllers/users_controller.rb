class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]
  before_action :authenticate_user, except: %i[create]

  def index
    ## Only admins can see all Users.
    if current_user.admin?
      users = User.all
      render json: { users: users }, status: :ok
    else
      render json: 'Not authorized to interact with this user.', status: :unauthorized
    end
  end

  def show
    render json: current_user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: 'user created', status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: 'user updated', status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.plants.each(&:destroy) if @user.plants
    if @user.destroy
      render json: 'user deleted', status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    # Rough authorization occurs here
    @user = params[:id] ? User.find(params[:id]) : current_user
    unless @user.id == current_user.id || current_user.admin?
      render json: 'Not authorized to interact with this user.', status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :location)
  end
end
